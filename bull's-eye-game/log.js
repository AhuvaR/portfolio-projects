// Get the modal
var modal = document.getElementById('id01');
var modal2 = document.getElementById('id02');


//sortage
function saveName() {
    let m = document.getElementById("signname").value
    let pass = document.getElementById("signpsw").value
    let pass1 = document.getElementById("signpsw2").value
if(pass==pass1){
    if (m != "" && pass!="") {
    localStorage.setItem(m + "_name", m)
    localStorage.setItem(m + "_p", pass)
    sessionStorage.setItem('userName',m)
    }
    else{
    alert("אחד מהנתונים חסר")
    event.preventDefault()
}
}
else{
    alert("הסיסמה לא תואמת טוב")
    event.preventDefault()
}
}

function checkName(){
    let name= document.getElementById("logun").value
    let pass = document.getElementById("logpsw").value
    if(localStorage.getItem(name + "_p") != null){
        if (localStorage.getItem(name + "_p") != pass) {
            alert('הססמה שגויה')
            event.preventDefault()
        }
        else
        sessionStorage.setItem('userName',localStorage.getItem(name+"_name"))
}
else{
    alert('אינך קיים עוד במערכת הרשם תחילה ')
    event.preventDefault()
            
}
}