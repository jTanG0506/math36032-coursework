AllOrders = readtable('purchasing_order.csv');

% Get all the users who have made at least one refund.
Returned_Orders = AllOrders(strcmp(AllOrders.Return, 'Y'), :);
Users_With_Returns = unique(Returned_Orders.Customer_ID);

% Get the orders that are placed by users that have made at least one refund.
Orders = AllOrders(ismember(AllOrders.Customer_ID, Users_With_Returns), :);
OrdersWithRatings = Orders(Orders.Rating > 0, :);

% Find parameters by minimising the cost function logreg.
orderRating = OrdersWithRatings.Rating;
orderIsReturned = strcmp(OrdersWithRatings.Return, 'Y');
lrParams = fminsearch(@(a) logreg(a, orderRating, orderIsReturned), [0 0]);

% Plot the linear regression graph.
hx = linspace(0, 6, 1001);
plot(orderRating, orderIsReturned, '*', hx, 1 ./ (1 + exp(-lrParams(1) * hx - lrParams(2))));
lg = legend('Raw Data', 'Logistic Regression');
set(lg,'Location', 'east');
xlabel('Rating');
xticks([1 : 5]);
ylabel('Order Returned');
yticks([0, 1]); yticklabels({'No', 'Yes'})
axis([0.5 5.5 -0.1 1.1]);

fprintf('α = %.5f, β = %.5f\n', lrParams);
