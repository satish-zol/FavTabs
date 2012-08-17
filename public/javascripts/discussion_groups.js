function search_groups()
{
    if(jQuery(".group_search_text").val()==jQuery(".group_search_text").next(".text_place_holder").html())
    {
        jQuery(".group_search_text").val("");
    }
    //jQuery(".group_search_text").closest("form").serialize();
    //window.location ="/discussion_groups/search_groups/"+jQuery(".group_search_text").val();
    return true;
}