# Main program
import calculator
import tax
import discount
import invoice

price = float(input("Enter price: "))
quantity = int(input("Enter quantity: "))

total = calculator.total(price, quantity)

dis = discount.discount(total)

after_discount = total - dis

gst = tax.tax(after_discount)

final = after_discount + gst

invoice.invoice(price, quantity, total, dis, gst, final)