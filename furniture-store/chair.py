from furniture import furniture
class chair (furniture):
    def __init__(self,id,name,wood,SmeterW,cloth,SmeterC):
        super(chair,self).__init__(id,name)
        self.matirials={
            "wood":{"name":wood,"SmeterW":SmeterW},
            "cloth":{"name":cloth,"SmeterC":SmeterC}
        }

    #חישוב המחיר למוצר
    #בדוגמת כיסא חישוב על פי עץ +בד (אם קיים)
    # ניגשנו לשטח העץ שנמצאת במילון  בתוך WOOD
    #כפול המחיר של החומר שנמצא בתוך הרשימה של החומרים שנמצא  במחלקת אבא-רהיט
    def payment(self):
        chairDetails=(self.matirials.get("wood").get("SmeterW") * self.matirialsPrice.get(self.matirials.get("wood").get("name"))+
           self.matirials.get("cloth").get("SmeterC") * self.matirialsPrice.get(self.matirials.get("cloth").get("name")))
        return chairDetails




