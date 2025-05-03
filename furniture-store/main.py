from chair import chair
import json


allFurnitores=[chair(1,"Noa","Alon",30,"velvet",60),
chair(2, "Ahuva", "Oren", 50, "", 0),
chair(3, "Elki", "Sendvitch", 35, "Silk", 65),
chair(4, "Avivit", "Oren", 40, "Copper", 60)
             ]
#בניית מערך חדש בעל שם העץ הרצוי עי	Comprehention
def arreyWithSpecifcWood(wood):
    filterArray=[x for x in allFurnitores  if wood==x.matirials.get("wood").get("name")]
    print(report(filterArray))

#הכנסת פרטי המוצרים לתוך משתנה לצורך המשתמש עי שימוש הספרייה חיצונית=JSON
def report(array):
    result=""
    for i in array:
        result+= i.name +json.dumps(i.matirials)+" |"
    return result

#בודק את את התשלום והאם צריך עודף באם המשתמש הכניס סכום שאינו מספיק הפונקציה תחזור על עצמה
def calculate(price):
    print("this is the cost")
    print(price)
    moanyAmuont=int(input("enter the money"))
    try:
        if moanyAmuont<price:
            print("not enough")
            calculate(price)
        else:
            excess = lambda x,y: x-y
            print("here is excess")
            print(excess(moanyAmuont,price))
    except ValueError:
        print("you tried entering a string")
    except:
        print("other error happened")





choise=""
while(choise!="exit"):
    print("here our products (/ to exit write 'exit') ")
    print(report(allFurnitores))
    choise=input("what would you to buy")
    if choise!="exit":
        for i in allFurnitores:
            if i.name==choise:
                c=int(input("how many do you want"))
                thePayment=i.payment()
                calculate(thePayment*c)
                i.invoicing(thePayment,c)
                print("thank you for buying")
                arreyWithSpecifcWood("Oren")












