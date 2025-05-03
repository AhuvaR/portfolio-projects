function getUserName() {
  document.getElementsByTagName('h3')[0].innerHTML += sessionStorage.getItem('userName')
}

let colors=new Array()
colors=['pink','yellow','orange','green','red','blue','bisque','purple']
let chosen=new Array(4)
let g=0
let i=0
while(i<chosen.length) {
let y=true
let tc=colors[Math.floor(Math.random()*colors.length)]
for(let index = 0; index < chosen.length; index++){
if(chosen[index]==tc){
y=false;}
}
if(y==true){
chosen[i]=tc;
console.log(chosen[i])
i++}  
}

function dragStart(event) {
event.dataTransfer.setData("Text", event.target.id);
}

  
function allowDrop(event) {
  event.preventDefault();
}
  
function dropit(event){
    const data = event.dataTransfer.getData("Text");
    let w=""+event.target.id
    let r=w[0]
    let o=document.getElementById(data).id
    if(o==r){
    event.preventDefault();
    
    event.target.appendChild(document.getElementById(data));}
}
function drop(event){
    
    event.preventDefault();
    const data = event.dataTransfer.getData("Text");
    event.target.appendChild(document.getElementById(data));
}

let turnsCounter=0;
function check(idvaelu){
turnsCounter++;

let wincounter=0
let neww=idvaelu.id;
let num=neww[2]
console.log(num)
if(idvaelu.children[0].children[0]==null || idvaelu.children[1].children[0]==null || idvaelu.children[2].children[0]==null || idvaelu.children[3].children[0]==null){
  alert("לא מילית את כל הניחושים")
  return; 
}
event.target.disabled = true
  let putIn =document.createElement('div')
  putIn.style.border="red 3px solid"
  putIn.style.backgroundColor="rgb(210, 204, 204)"
  putIn.setAttribute('id', 'pi')
  putIn.style.display="flex"
  putIn.style.height="57px"
  document.getElementById('ans').appendChild(putIn)
if(idvaelu.id=="bd1"){

}
num++;
var first='bd'+(num);


var taywan=document.getElementById(first)

for (let i = 0; i < 4; i++) {
  if(idvaelu.id!='bd10'){
    taywan.children[i].hidden=false

  }
  for(let j=0;j<4;j++){
    let container=idvaelu.children[j]; 
    
    if(i==0){
      let spn=container.children[0];
      var t=spn.getAttribute("data-color")
      document.getElementById(t).appendChild(spn)
      container.style.backgroundColor=t
    }
else{var t=container.style.backgroundColor
      }
      
      container.style.pointerEvents = "none";
     
     

    if(chosen[i]==t){
   
    if(i==j){
      wincounter++
     let best =document.createElement('div')
     best.style.width="20px"
     best.style.height="20px"
     best.style.backgroundColor="blue"
     best.style.marginLeft="3px"
     document.getElementById('pi').appendChild(best)
     putIn.appendChild(best)
    
   if(wincounter==4){
alert('!ניצחת')

  if(turnsCounter<localStorage.getItem("score5")){
    localStorage.setItem("score5",turnsCounter)
    localStorage.setItem("scoreName5",sessionStorage.getItem('userName'))
    localStorage.setItem("scoreDate5",Date())
    let yachad=4
    let shivtey=5
    let right=0
while(yachad>0 && right!=4){

        let try1='score'+yachad;
        let try2='score'+shivtey;
        let temp1=parseInt(localStorage.getItem(try2))
        let temp2=parseInt(localStorage.getItem(try1))
    if(temp1<temp2){
          let num=localStorage.getItem("score"+yachad)
          let name=localStorage.getItem("scoreName"+yachad)
          let date=localStorage.getItem("scoreDate"+yachad)
          localStorage.setItem("score"+yachad,localStorage.getItem("score"+shivtey))
          localStorage.setItem("scoreName"+yachad,localStorage.getItem("scoreName"+shivtey))
          localStorage.setItem("scoreDate"+yachad,localStorage.getItem("scoreDate"+shivtey))
          localStorage.setItem("score"+shivtey,num)
          localStorage.setItem("scoreName"+shivtey,name)
          localStorage.setItem("scoreDate"+shivtey,date)
          shivtey--;
          yachad--;  
          
    }
    right++
  }

}
return;        
   }
  }
     else{
     
     let good =document.createElement('div')
     good.style.width="20px"
     good.style.height="20px"
     good.style.marginLeft="3px"
     good.style.backgroundColor="black"
     document.getElementById('pi').appendChild(good)
     putIn.appendChild(good)
    }
   }
  }}
  taywan.children[4].hidden=false
  if(idvaelu.id=='bd10'){
    document.getElementById('re').style.backgroundColor="red"
alert('פישלת')

  }
}
 



function refresh(){
  window.location.reload("Refresh")
}
 
 function background(){
  let colorIndex = event.target.selectedIndex
  let thi="url('רקע/"+colorIndex+".png')"
  document.body.style.backgroundImage=thi
  }
   
  
  function changeFontSize()
  {
      // DOM - document object model
      // מסמך שיש בתוכו עץ אובייקטים
      //HTML האובייקטים אלו תגיות שנמצאות בדף
      // כל תגיץת נהפכה לאובייקט עם כל המאפיינים שלה
      // כמובן שהעץ הוא בנוי עם ההררכיה הנכונה
      // כדי לגשת לאובייקטים
      //document ניגש למסמך
      // ונפעיל עליו פונקציות חיפוש
      //כל פונקציית חיפוש מחזירה ערכים
      // לאחר שהערכים יהיו אצלינו במשתנים - לאחר שתפסנו אותם
      // נוכל לגשת לכל המאפיינים והפונקציות שלהם
      // getElementById -שלו ID מחזיר אובייקט יחיד שזה ה
      for(let r=0;r<2 ;r++){
     let trh= document.getElementsByClassName("trHeader")[r]
     console.log(trh)
     trh.style.fontSize='19px'
     }
  }