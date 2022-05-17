function confirmLogin() {
    if(document.login_form.id.value === ""){
        alert("아이디를 입력하세요.");
        document.login_form.id.focus();
        return;
    }

    if(document.login_form.pw.value === ""){
        alert("비밀번호를 입력하세요.");
        document.login_form.pw.focus();
        return;
    }

    document.login_form.submit();
}

function confirmJoin() {
    if(document.join_form.id.value === ""){
        alert("아이디를 입력하세요.");
        document.join_form.id.focus();
        return;
    }

    if(document.join_form.pw.value === ""){
        alert("비밀번호를 입력하세요.");
        document.join_form.pw.focus();
        return;
    }

    if(document.join_form.name.value === ""){
        alert("이름을 입력하세요.");
        document.join_form.name.focus();
        return;
    }
    document.join_form.submit();
}


function confirmModify() {
    if(document.modify_form.pw.value === ""){
        alert("비밀번호를 입력하세요.");
        document.modify_form.pw.focus();
        return;
    }
    document.modify_form.submit();
}

function confirmCheck(){
    if (confirm("정말로 아이디를 삭제하시겠습니까??")){
        location.href="delete_Id.jsp";
    }else{
        return;
    }
}