INSERT INTO Authors (AuthorID, AuthorName) VALUES
(1, 'Dale Carnegie'),
(2, 'Stephen R. Covey'),
(3, 'Robin Sharma'),
(4, 'Napoleon Hill'),
(5, 'James Clear');

INSERT INTO Categories (CategoryID, CategoryName) VALUES
(1, 'Self-Help'),
(2, 'Productivity'),
(3, 'Leadership'),
(4, 'Personal Development'),
(5, 'Success');

INSERT INTO Books (BookID, Title, AuthorID, CategoryID, Price, StockQuantity) VALUES
(1, 'How to Win Friends and Influence People', 1, 1, 399.00, 120),
(2, 'The 7 Habits of Highly Effective People', 2, 2, 499.00, 100),
(3, 'The Monk Who Sold His Ferrari', 3, 3, 299.00, 150),
(4, 'Think and Grow Rich', 4, 5, 350.00, 80),
(5, 'Atomic Habits', 5, 2, 450.00, 200),
(6, 'Leadership Wisdom', 3, 3, 325.00, 90),
(7, 'Success Through a Positive Mental Attitude', 4, 5, 375.00, 70),
(8, 'The Power of Habit', 5, 4, 400.00, 110),
(9, 'You Can Heal Your Life', 1, 4, 425.00, 60),
(10, 'Awaken the Giant Within', 2, 5, 500.00, 75);

INSERT INTO Orders (OrderId, CustomerName, OrderDate) VALUES
(1, 'Ravi Kumar', '2024-12-01'),
(2, 'Anjali Gupta', '2024-12-05'),
(3, 'Vikas Singh', '2024-12-10');

INSERT INTO OrderDetails (OrderDetailID, OrderID, BookID, Quantity) VALUES
(1, 1, 1, 2), -- Ravi buys 2 copies of 'How to Win Friends and Influence People'
(2, 1, 3, 1), -- Ravi buys 1 copy of 'The Monk Who Sold His Ferrari'
(3, 2, 5, 2), -- Anjali buys 2 copies of 'Atomic Habits'
(4, 2, 8, 1), -- Anjali buys 1 copy of 'The Power of Habit'
(5, 3, 4, 3), -- Vikas buys 3 copies of 'Think and Grow Rich'
(6, 3, 10, 1); -- Vikas buys 1 copy of 'Awaken the Giant Within'

