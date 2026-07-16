import calculator
import discount
import tax
import invoice

item = input("Enter item name: ")
price = float(input("Enter price: "))
quantity = int(input("Enter quantity: "))

discount_percent = float(input("Enter discount percentage: "))
tax_percent = float(input("Enter tax percentage: "))

# Total amount
total = calculator.total(price, quantity)

# Discount
dis = discount.discount(total, discount_percent)

# Amount after discount
amount = total - dis

# Tax
gst = tax.tax(amount, tax_percent)

# Final bill
final = amount + gst

# Print Invoice
invoice.invoice(item, price, quantity, total, dis, gst, final)