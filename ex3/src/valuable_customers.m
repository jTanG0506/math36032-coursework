Orders = readtable('purchasing_order.csv');
OrdersFromC = Orders(strcmp(Orders.Product_Category, 'C'), :);

% Mean order value for Category C products, by Customer ID.
NonReturnedOrders = OrdersFromC(strcmp(OrdersFromC.Return, 'N'), :);
CatCValue = groupsummary(OrdersFromC, {'Customer_ID'}, ...
                         'mean', 'Product_Value');

% Mean rating, by Customer ID.
OrdersWithRatings = OrdersFromC(OrdersFromC.Rating > 0, :);
Ratings = groupsummary(OrdersWithRatings, {'Customer_ID'}, ...
                       'mean', 'Rating');

% Create a table of the form [Customer ID, Mean Value, Mean Rating].
TLeft = table(CatCValue.Customer_ID, CatCValue.mean_Product_Value, ...
              'VariableNames', {'Customer_ID', 'Mean_Value'});
TRight = table(Ratings.Customer_ID, Ratings.mean_Rating, ...
               'VariableNames', {'Customer_ID', 'Mean_Rating'});
T = outerjoin(TLeft, TRight, 'MergeKeys', true);

% Replace any potential NaN values with 0.
T = fillmissing(T, 'constant', 0);

% Standardize attributes and calculate ranking by summing the z-scores.
T.Mean_Value = zscore(T.Mean_Value);
T.Mean_Rating = zscore(T.Mean_Rating);
Ranking = table(T.Mean_Value + T.Mean_Rating, 'VariableNames', {'Ranking'});
T = [T Ranking];

% Sort customers based on ranking and output top 10 customers.
T = sortrows(T, 'Ranking', 'Descend');
disp(T(1:10, {'Customer_ID', 'Ranking'}));
