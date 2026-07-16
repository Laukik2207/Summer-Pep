# Invoice generation functions
def invoice(item, price, quantity, total, discount, tax, final):
    print("\n========== INVOICE ==========")
    print("Item Name :", item)
    print("Price     :", price)
    print("Quantity  :", quantity)
    print("Total     :", total)
    print("Discount  :", discount)
    print("Tax       :", tax)
    print("Final Bill:", final)
    print("=============================")