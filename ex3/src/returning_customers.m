AllOrders = readtable('purchasing_order.csv');

% Get all the users who have made at least one refund.
Users_With_Returns = unique(AllOrders(strcmp(AllOrders.Return, 'Y'), :).Customer_ID);

% Get the orders that are placed by users that have made at least one refund.
Orders = AllOrders(ismember(AllOrders.Customer_ID, Users_With_Returns), :);

initialState = struct('hasRefunded', false, 'totalBefore', 0, 'totalAfter', 0);
initialStates = repmat({initialState}, length(Users_With_Returns), 1);
m = containers.Map(Users_With_Returns, initialStates);

% Enumerate over all orders placed by users with at least one refund.
for row = 1 : height(Orders)
  order = Orders(row, :);
  customer = m(order.Customer_ID);

  % If the order was returned, set the hasRefunded flag to true for the customer.
  if strcmp(order.Return, 'Y')
    customer.hasRefunded = true;
  else
    % Update the total value based on whether the customer has returned an order yet.
    if customer.hasRefunded
      customer.totalAfter = customer.totalAfter + order.Product_Value;
    else
      customer.totalBefore = customer.totalBefore + order.Product_Value;
    end
  end
  
  m(order.Customer_ID) = customer;
end

mapValues = m.values;
customerSummary = [mapValues{:}];
totalSpending = [customerSummary.totalBefore] + [customerSummary.totalAfter];
percentSpentAfterRefund = [customerSummary.totalAfter] ./ totalSpending * 100;

% Proportion of funds that were spent after the first refund.
overallPercentSpentAfter = sum([customerSummary.totalAfter]) / sum([totalSpending]) * 100;
fprintf('Overall, %.2f%% of the total order value was spent after a customers first refund\n', ...
        overallPercentSpentAfter);

% Average of a customers total order value after the first returned order.
averageSpentAfter = mean(percentSpentAfterRefund);
fprintf('The average of a customers total order value after the first refund is %.2f%%\n', ...
        averageSpentAfter);

% Percentage of customers who spent less than 50% of orders after first returned order.
spentLessThanHalf = sum(percentSpentAfterRefund > 50) / length(percentSpentAfterRefund) * 100;
fprintf('%.2f%% of customers spent more than half their total order value after the first refund\n', ...
        spentLessThanHalf);

% Histogram showing the distribution of order value after first returned order.
histogram(percentSpentAfterRefund, 20);
grid on;
xlabel('Percentage of total value spent after the first refund');
ylabel('Number of customers'); ylim([0 13]);
