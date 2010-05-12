/* Copied from http://www.ghacks.net/2009/01/15/using-javascript-to-hide-and-unhide-elements-dynamically/
 */
function display(action, id)
{
  if (action == 'show')
  {
    Effect.SlideDown("comment-"+id);
    document.getElementById("clink-"+id).href= "javascript:display('hide', "+id+")";
    document.getElementById("clink-"+id).innerHTML = "Hide";
  }

  if (action == 'hide')
  {
    Effect.SlideUp("comment-"+id);
    document.getElementById("clink-"+id).href = "javascript:display('show', "+id+")";
    document.getElementById("clink-"+id).innerHTML = "Show";
  }
}

function displayAll(action)
{
  if (action == 'show')
  {
    document.getElementById("blog-comments").style.display = "block";
    document.getElementById("clink").href= "javascript:displayAll('hide')";
    document.getElementById("clink").innerHTML = "Hide Comments";
    ch = document.getElementById("blog-comments").children;
    for(var i = 0; i < ch.length; i++)
    {
      ch2 = ch[i].children
      for(var j = 0; j < ch2.length; j++)
      {
        var regexp = /^comment-\d*$/
        if(ch2[j].id.search(regexp) != -1)
        {
          element = ch2[j];
          id = element.id.replace(/[^0-9]/g, '');
          ch2[j].style.display = "block";
          document.getElementById("clink-"+id).href= "javascript:display('hide', "+id+")";
          document.getElementById("clink-"+id).innerHTML = "Hide";
        }
      }
    }
  }

  if (action == 'hide')
  {
    document.getElementById("blog-comments").style.display = "none";
    document.getElementById("clink").href = "javascript:displayAll('show')";
    document.getElementById("clink").innerHTML = "Show Comments";
  }
}