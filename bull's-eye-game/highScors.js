
function getUserName() {
    document.getElementsByTagName('h3')[0].innerHTML += sessionStorage.getItem('userName')
}


function print(){
    document.getElementById("score1").innerHTML=localStorage.getItem("score1")
    document.getElementById("scoreName1").innerHTML=localStorage.getItem("scoreName1")
    document.getElementById("scoreDate1").innerHTML=localStorage.getItem("scoreDate1")

    document.getElementById("score2").innerHTML=localStorage.getItem("score2")
    document.getElementById("scoreName2").innerHTML=localStorage.getItem("scoreName2")
    document.getElementById("scoreDate2").innerHTML=localStorage.getItem("scoreDate2")

    document.getElementById("score3").innerHTML=localStorage.getItem("score3")
    document.getElementById("scoreName3").innerHTML=localStorage.getItem("scoreName3")
    document.getElementById("scoreDate3").innerHTML=localStorage.getItem("scoreDate3")

    document.getElementById("score4").innerHTML=localStorage.getItem("score4")
    document.getElementById("scoreName4").innerHTML=localStorage.getItem("scoreName4")
    document.getElementById("scoreDate4").innerHTML=localStorage.getItem("scoreDate4")

    document.getElementById("score5").innerHTML=localStorage.getItem("score5")
    document.getElementById("scoreName5").innerHTML=localStorage.getItem("scoreName5")
    document.getElementById("scoreDate5").innerHTML=localStorage.getItem("scoreDate5")

}
 
// localStorage.setItem("score1",11)
// localStorage.setItem("score2",11)
// localStorage.setItem("score3",11)
// localStorage.setItem("score4",11)
// localStorage.setItem("score5",11)

// localStorage.setItem("scoreName1","")
// localStorage.setItem("scoreName2","")
// localStorage.setItem("scoreName3","")
// localStorage.setItem("scoreName4","")
// localStorage.setItem("scoreName5","")

// localStorage.setItem("scoreDate1","")
// localStorage.setItem("scoreDate2","")
// localStorage.setItem("scoreDate3","")
// localStorage.setItem("scoreDate4","")
// localStorage.setItem("scoreDate5","")








