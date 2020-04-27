AllOrders = readtable('purchasing_order.csv');

% Get all the users who have made at least one refund.
ReturnedOrders = AllOrders(strcmp(AllOrders.Return, 'Y'), :);
UsersWithReturns = unique(ReturnedOrders.Customer_ID);

% Get the orders that are placed by users that have made a refund.
Orders = AllOrders(ismember(AllOrders.Customer_ID, UsersWithReturns), :);
OrdersWithRatings = Orders(Orders.Rating > 0, :);

% Find parameters by minimising the cost function.
orderRating = OrdersWithRatings.Rating;
isReturned = strcmp(OrdersWithRatings.Return, 'Y');
lrParams = fminsearch(@(a) costFunction(a, orderRating, isReturned), [0 0]);
fprintf('[alpha, beta] = [%.5f, %.5f]\n', lrParams);

% Plot the linear regression graph.
hx = linspace(0, 6, 1001);
plot(orderRating, isReturned, 'o', ...
     hx, 1 ./ (1 + exp(-lrParams(1) * hx - lrParams(2))));
lg = legend('Raw Data', 'Logistic Regression');
set(lg, 'Location', 'east');
xlabel('Rating'); xticks([1 : 5]);
ylabel('Order Returned'); yticks([0, 1]); yticklabels({'No', 'Yes'})
axis([0.5, 5.5, -0.2, 1.2]);
