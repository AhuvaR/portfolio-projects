#במחלקה זו מאפיינים שישמשו לכל הסוגי רהיטים שיורשים אותם כגון כיסא שולחן וספה
#(בדוגמא מופיע כיסא)
class furniture:
    def __init__(self,id,name):
        self.id=id;
        self.name=name;
        self.matirialsPrice= {
            "Alon":30,
            "Sendvitch":40,
            "Oren":50,
            "Velvet":25,
            "cutton":50,
            "Silk":100,
            "Iron":70,
            "Copper":35
        }


    def invoicing(self,one,amount):
            # יצרת קובץ חשבונית בו מופיע שם המוצר המחיר ליחדה וכמות וחשבון סופי
            newfile = open('C:/לימודים/invoicing.txt', 'a')
            newfile.write("Here is your shoping details:\n")
            newfile.write(self.name+"\n")
            newfile.write("payment for one chair:"+"\n")
            newfile.write(str(one))
            newfile.write("amount:" + "\n")
            newfile.write(str(amount) )
            newfile.write("conclution:" + "\n")
            newfile.write( str(amount*one) )
            newfile.close()





