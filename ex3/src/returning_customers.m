AllOrders = readtable('purchasing_order.csv');

% Get all the users who have made at least one refund.
ReturnedOrders = AllOrders(strcmp(AllOrders.Return, 'Y'), :);
UsersWithReturns = unique(ReturnedOrders.Customer_ID);

% Get the orders that are placed by users that have made a refund.
Orders = AllOrders(ismember(AllOrders.Customer_ID, UsersWithReturns), :);

initialState = struct('hasRefunded', false, 'totalBefore', 0, ...
                      'totalAfter', 0);
initialStates = repmat({initialState}, length(UsersWithReturns), 1);
m = containers.Map(UsersWithReturns, initialStates);

% Enumerate over all orders placed by users with at least one refund.
for row = 1 : height(Orders)
  order = Orders(row, :);
  customer = m(order.Customer_ID);

  % If the order was returned, set the customer's hasRefunded flag to true.
  if strcmp(order.Return, 'Y')
    customer.hasRefunded = true;
  else
    % Update the total value based on is customer's hasRefunded flag.
    if customer.hasRefunded
      customer.totalAfter = customer.totalAfter + order.Product_Value;
    else
      customer.totalBefore = customer.totalBefore + order.Product_Value;
    end
  end
  
  m(order.Customer_ID) = customer;
end

mapValues = m.values
customerData = [mapValues{:}]
totalSpending = [customerData.totalBefore] + [customerData.totalAfter];
percentSpentAfterRefund = [customerData.totalAfter] ./ totalSpending * 100;

% Average of a customers total order value after the first returned order.
averageSpentAfter = mean(percentSpentAfterRefund);
fprintf('The average of a customers total order value after the first
         refund is %.2f%%\n', averageSpentAfter);

histogram(percentSpentAfterRefund, 20);
grid on;
xlabel('Percentage of total value spent after the first refund');
ylabel('Number of customers'); ylim([0 13]);
