/* Function to check validation for Url in discussion*/
var is_sending = false;
function check_url()
{
    var url = jQuery("#discussion_discussion").val();
    var is_url = jQuery("#url_disc_radio").is(":checked");
    var flag = true;
    printError("urlError","");
    jQuery(".error").html("");
    if(url!="" && !url.match(/^(ht|f)tps?:\/\//) && is_url)
    {
        url= "http://"+url;
        jQuery("#discussion_discussion").val(url);
   
    }

    if(is_url){
        if(validate_url(url)==true)
        {
            flag = false;
        }
        else
        {
            flag= true;
        }
    }
    else
    {
        if(url.length==0)
        {
            error="Please enter Comment/Question."
            printError("urlError",error);
            flag=false;
        }
        else
        {
            if(url.length>1000)
            {
                error="Comment/Question should be of maximum 1000 characters."
                printError("urlError",error);
                flag=false;
            }
        }
    }
    var $attchments = jQuery(".dis_attachment_container .discussion_attachment_file");
    var $attchments_desc = jQuery(".dis_attachment_container .discussion_attachment_desc");
    $attchments.each(function(){
        var $this = jQuery(this);
        if($this.val()=="")
        {
            $this.next(".error").html("Please select file.");
            flag = false;
        }
    });
    $attchments_desc.each(function(){
        var $this = jQuery(this);
        if($this.val().length==0)
        {
            $this.next(".error").html("Please enter description.");
            flag = false;
        }
        else
        {
            if($this.val().length>100)
            {
                $this.next(".error").html("Description should be of maximum 100 characters.");
                flag = false;
            }
        }

    });

    if(jQuery("#discuss_with_group").is(":checked") && jQuery(".posting_group:checked").length<=0)
    {
        jQuery("#group_id_error").html("Please select at least one group.");
        flag = false;
    }

    if(jQuery("#discuss_with_crowd").is(":checked") && jQuery(".posting_group:checked").length<=0)
    {
        jQuery("#crowd_id_error").html("Please select at least one crowd.");
        flag = false;
    }

    if(is_sending){
        flag = false;
    }
    
    if(flag){
        is_sending = true;
    }
    return flag;
}

function validate_url(url){
    error_blank_url();
    var flag=false;
    var urlRegExp = /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/;
    if(url.length==0)
    {
        error="Please enter url."
        printError("urlError",error);
        flag=true;
    }
    else
    {
        if(url.length>300)
        {
            error="Url is too long."
            printError("urlError",error);
            flag=true;
        }
    }
    if(url.length!=0)
    {
        if(!url.match(urlRegExp))
        {
            error="Please enter valid url."
            printError("urlError",error);
            flag=true;
        }
    }

    if(flag==true)
    {
        return flag;
    }
}

function error_blank_url()
{
    document.getElementById("urlError").innerHTML="";
}
