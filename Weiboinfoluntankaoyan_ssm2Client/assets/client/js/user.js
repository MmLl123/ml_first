/**
 * Created by ideabobo on 14-6-28.
 */

/***************************************用户模块*******************************************/
$(function(){
    var uinfo = localStorage['userinfo'];
    var f = localStorage['welcomed'];
    //if(f){
        if(uinfo && $.trim(uinfo)!=""){
            uinfo  = JSON.parse(uinfo);
            $("#lusername").val(uinfo.username);
            $("#lpasswd").val(uinfo.passwd);
            uinfo.remember = "1";
            //if(uinfo.roletype=="2"){
                login(uinfo);
            //}

        }
    //}else{
    //    changePage("welcomepage1","none");
    //}

    //$("#welcome1").bind("swipeleft tap",function(){
    //    changePage("welcomepage2");
    //});
    //$("#welcome2").bind("swipeleft tap",function(){
    //    changePage("welcomepage3");
    //});
    //$("#welcome3").bind("swipeleft tap",function(){
    //    changePage("welcomepage4");
    //});
    //$("#welcome4").bind("swipeleft tap",function(){
    //    changePage("welcomepage5");
    //});
    //$("#welcome5").bind("swipeleft tap",function(){
    //    changePage("welcomepage6");
    //});
    //$("#welcome6").bind("swipeleft tap",function(){
    //    changePage("loginpage");
    //    localStorage['welcomed'] = "yes";
    //});


});
var userinfo = null;
function login(uinfo){
    var fdata = uinfo || serializeObject($("#loginform"));
    if($.trim(fdata.username)=="" || $.trim(fdata.passwd) == ""){
        showLoader("请输入用户名或密码！",true);
        return;
    }
    fdata.table="user";
    ajaxCallback("findJ",fdata,function(data){
       if(!data){
           showLoader("用户名或密码错误",true);
           changePage("loginpage");
       }else{

           showLoader("登录成功!",true);
           //bindClient();
           userinfo = data;
           toMain();
           if(fdata.remember == "1"){
                localStorage["userinfo"] = JSON.stringify(data);
           }else{
               localStorage["userinfo"] = "";
           }


           //toGoods();
           /*if(userinfo.roletype==2){
                toVideoList();
           }else{
               ajaxCallback("getShop",{id:userinfo.sid},function(data){
                   focushop = data;
                   toMyBill();
                   startBillListLoop();
               });

           }*/


       }
    });
}

function toSettingPage(){
    changePage('settingpage')
}

function logout(){
    userinfo = null;
    localStorage['userinfo'] = "";
    toLogin();
}

function toRegister(){
    changePage("registerpage");
}

function toLogin(){
    $($(':input','#loginform').get(1)).val("");
    changePage("loginpage");
}

function register(){

    var fdata = serializeObject($("#registerform"));
    if($.trim(fdata.username) == "" || $.trim(fdata.passwd) == "" || $.trim(fdata.tel) == ""){
        showLoader("请填写完整信息!",true);
        return;
    }
    if(fdata.tel.length<11){
        showLoader("电话号码格式不对!",true);
        return;
    }
    if(fdata.passwd != fdata.passwd2){
        showLoader("两次密码不一致!",true);
        return;
    }
    /*if(uploadFileUrl){
        uplaodImg(function(r){
            fdata.img = r;
            commitRegiesterInfo(fdata);
        });
    }else{*/
    ajaxFormUploadFile(function (r){
        fdata.img = r;
        commitRegiesterInfo(fdata);
    });

    //}


}

function commitRegiesterInfo(fdata){
    fdata.table="user";
    fdata.roletype="2";
    ajaxCallback("findJ",fdata,function(d){
        if(!d){
            ajaxCallback("saveJ",fdata,function(r){
                if(r.info){
                    showLoader("注册成功!",true);
                    userinfo = fdata;
                    userinfo.id = r.info;
                    //addAddress();
                    toLogin();
                }else{
                    showLoader("注册失败请稍候再试!",true);
                }
                uploadFileUrl = null;
            });
        }else{
            showLoader("用户名已存在!",true);
        }
    });
}

function myinfo(){
    if(!userinfo){
        changePage("loginpage");
        return;
    }
    changePage("userinfopage");
    $("#editbutton").hide();
    $("#vusername").text(userinfo.username);
    $("#vtel").val(userinfo.tel);
    $("#vqq").val(userinfo.qq);
    $("#vwechat").val(userinfo.wechat);
    $("#vsex").val(userinfo.sex);
    $("#vbirth").val(userinfo.birth);
    $("#vemail").val(userinfo.email);
    $("#vaddress").val(userinfo.address);
    $("#vimg").val(userinfo.img);
    $("#vnote").val(userinfo.note);
    $("#rmyImage2").attr("src",fileurl+userinfo.img);
}

function editUserInfo(){
    $("#editbutton").show();
}

function updateUserInfo(){
    var fdata = serializeObject($("#userform"));
    fdata.id = userinfo.id;
    /*if(uploadFileUrl){
        uplaodImg(function(r){
            fdata.img = r;
            commitUpdateUserInfo(fdata);
        });
    }else{*/
        commitUpdateUserInfo(fdata);
    //}
}

function commitUpdateUserInfo(fdata){
    fdata.table = "user";
    ajaxCallback("saveJ",fdata,function(user){
        if(user){
            showLoader("保存成功!",true);
            userinfo = fdata;
            uploadFileUrl = null;
        }else{
            showLoader("保存失败,请稍候再试!",true);
        }
    });
}

function toChangePasswd(){
    $("#pusername").text("用户名:"+userinfo.username);
    changePage("passwdpage");
}

function changePasswd(){
    var fdata = serializeObject($("#passwdform"));
    fdata.id = userinfo.id;
    if(fdata.oldpasswd != userinfo.passwd){
        showLoader("原始密码错误！",true);
        return;
    }
    if($.trim(fdata.passwd) == ""){
        showLoader("密码不能为空！",true);
        return;
    }
    if(fdata.passwd != fdata.passwd2){
        showLoader("两次密码不一致！",true);
        return;
    }
    userinfo.passwd = fdata.passwd;
    userinfo.table="user";
    ajaxCallback("saveJ",userinfo,function(r){
        if(r){
            showLoader("保存成功!",true);
            setTimeout(function(){
                toLogin();
            },2000);
        }else{
            showLoader("保存失败,请稍候再试!",true);
        }
    });
}

function toMore(){
    changePage('morepage');
    $("#myname").text(userinfo.username+" 粉丝数:"+(userinfo.fs||0));
    if(userinfo.img){
        $("#myphoto2").attr("src",fileurl+userinfo.img);
    }

    //$("#mylevel").text(":"+userinfo.qd);
}

/***************************************用户模块*******************************************/

function clickTag(el){
    if($(el).hasClass("tagfocus")){
        $(el).removeClass("tagfocus");
    }else{
        $(el).addClass("tagfocus");
    }
}
function sureBiaoqian(){
    var ysels = $("#yingshictn .tagfocus");
    var zxels = $("#zixunctn .tagfocus");
    var ysid = "";
    var zxid = "";
    /*for(var i=0;i<ysels.length;i++){
        if(ysid!=""){
            ysid += ","+$(ysels[i]).data("value");
        }else{
            ysid = $(ysels[i]).data("value");
        }
    }*/
    for(var i=0;i<zxels.length;i++){
        if(zxid!=""){
            zxid += ","+$(zxels[i]).data("value");
        }else{
            zxid = $(zxels[i]).data("value");
        }
    }

    ajaxCallback("saveJ",{tags:zxid,id:userinfo.id,table:"user"},function(data){
        userinfo.tags = zxid;
        showLoader("操作成功!",true);
    });
}

function toTags(){
    changePage('tagpage');
    ajaxCallback("listJ",{table:"type"},function(data){
        var zxhtml = '<span>设置标签:</span>';
        var yshtml = '<span>影视标签:</span>';
        for(var i=0;i<data.length;i++){
            var obj = data[i];
            //if(obj.ttype==1){
            zxhtml+='<span onclick="clickTag(this);" data-value="'+obj.id+'" class="tagitem">'+obj.title+'</span>';
            /*}else{
                yshtml+='<span onclick="clickTag(this);" data-value="'+obj.id+'" class="tagitem">'+obj.title+'</span>';
            }*/
        }

        //$("#yingshictn").html(yshtml);
        $("#zixunctn").html(zxhtml);
    });
}













/****************************************************在线收藏***********************************/
function toFavs(){
    changePage("favspage");
    ajaxCallback("listJ",{table:"type"},function (data) {
        $("#ftypeid").refreshShowSelectMenu(data);
        listMyFav();
    });

}


function listMyFav(){
    var typeid = $("#ftypeid").val();
    var kllshow = 0;

    var sql = "select * from wct_blog where id in ("+userinfo.favs+")";
    if(typeid){
        sql+=" and typeid="+typeid;
    }
    ajaxCallback("listSqlJ",{sql:sql},function (data) {
        var ltpl = {};
        ltpl.tpl = '<li onclick="blogDetail(%s);">'+
            '<img style="height: 100px;margin: 10px 0 0 10px" src="'+fileurl+'%s">'+
            '<h2>%s</h2>'+

            '<p style="color: red;">%s</p>'+
            '</li>';
        ltpl.colums = ["id","img","title","typecn"];
        for(var i=0;i<data.length;i++){
            var obj = data[i];
            kllshow+=obj.kll*1;
        }
        $("#kllshow").text("热量/消耗卡洛里:"+kllshow);
        $("#favslist").data("property",JSON.stringify(ltpl));
        $("#favslist").refreshShowListView(data);
    })
}




function toggleFavs(){
    if(checkFavs()){
        deleteFavs();
    }else{
        saveFavs();
    }
}

function checkFavs(){
    var favs = userinfo.favs;
    var flag = false;
    $("#favbtn").text("加入收藏");
    if(favs){
        favs+="";
        var favarray = favs.split(",");
        for(var i=0;i<favarray.length;i++){
            if(favarray[i]==focusobj.id){
                $("#favbtn").text("移除收藏");
                flag = true;
                break;
            }
        }
    }


    return flag;

}


function saveFavs(){
    var favs = userinfo.favs;
    if(favs){
        favs+="";
        var favarray = favs.split(",");
        var flag = true;
        for(var i=0;i<favarray.length;i++){
            if(favarray[i]==focusobj.id){
                flag = false;
                break;
            }
        }
        if(flag){
            favs+=","+focusobj.id;
        }
    }else{
        favs = focusobj.id;
    }

    ajaxCallback("saveJ",{table:"user",favs:favs,id:userinfo.id},function (data) {
        showLoader("操作成功!",true);
        userinfo.favs = favs;
        checkFavs();
        addFavCount();
    })

}

function addFavCount(){
    var favcount = focusobj.favcount||0;
    favcount+=1;
    ajaxCallback("saveJ",{table:"blog",id:focusobj.id,favcount:favcount},function (data) {

    });
}

function deleteFavs(gid){
    var id = gid || focusobj.id;
    var favs = userinfo.favs;
    var tfavs = "";
    if(favs){
        favs+="";
        var favarray = favs.split(",");
        for(var i=0;i<favarray.length;i++){
            if(favarray[i]==id){
                continue;
            }else{
                if(tfavs==""){
                    tfavs = favarray[i];
                }else{
                    tfavs+=","+favarray[i];
                }
            }
        }

    }

    ajaxCallback("saveJ",{table:"user",favs:tfavs,id:userinfo.id},function (data) {
        showLoader("操作成功!",true);
        userinfo.favs = tfavs;
        if(gid){
            toFavs();
        }else{
            checkFavs();
        }

    })

}







/****************************************************在线收藏***********************************/


function toDaka(){
    changePage('dakapage');
    ajaxCallback("listJ",{uid:userinfo.id,table:"daka"},function(data){
        var pd = {};
        pd.tpl = '<li>' +
            //'<img style="height: 80px;" src="'+fileurl+'%s"/>'+
            '<h2>%s</h2>'+
            '</li>';
        pd.colums = ["ndate"];
        $("#dakalist").data("property",JSON.stringify(pd));
        $("#dakalist").refreshShowListView(data);
    });
}

function daka(){
    var ndate = getNdateNian();
    ajaxCallback("listJ",{uid:userinfo.id,ndate:ndate,table:"daka"},function(data){
        if(data&&data.length){
            showLoader("已经打过了!",true);
        }else{
            ajaxCallback("saveJ",{uid:userinfo.id,ndate:ndate,table:"daka"},function(data2){
                toDaka();
            });
        }
    });
}


function addFs(uid){
    ajaxCallback("findJ",{table:"user",id:uid},function (fuser) {
        var fs = fuser.fs;
        if(fs){
            fs+=1;
        }else{
            fs = 1;
        }
        ajaxCallback("saveJ",{table:"user",id:uid,fs:fs},function (data) {

        });
    });

}


function toTouxiang(){
    changePage('touxiangpage');
}
function saveTouxiang(){
    ajaxFormUploadFile(function (r){
        if(r){
            userinfo.img = r;
            ajaxCallback("saveJ",{id:userinfo.id,img:r,table:"user"},function (data) {
                showLoader("操作成功!",true);
            });
        }

    })
}





function charge(){
    var money = $("#money").val();
    var umoney = userinfo.money || 0;
    if(umoney){
        umoney+=money*1;
    }else{
        umoney = money*1;
    }
    userinfo.money = umoney;
    ajaxCallback("saveJ",{id:userinfo.id,table:"user",money:umoney},function(data){
        showLoader("操作成功!",true);
        toMyMoney();
    });
}

function disCharge(total,cb){
    var umoney = userinfo.money || 0;
    if(umoney<total){
        showLoader("余额不足!",true);
        return false;
    }else{
        userinfo.money = umoney*1-total*1;
        ajaxCallback("saveJ",{id:userinfo.id,table:"user",money:userinfo.money},function(data){
            cb && cb();
        });
    }

}

function toMyMoney(){
    changePage('moneypage');
    $("#lingqian").text((userinfo.money||0)+"元");
}