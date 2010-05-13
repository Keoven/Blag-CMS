/* Copied from http://www.ghacks.net/2009/01/15/using-javascript-to-hide-and-unhide-elements-dynamically/
 */
function display(action, id)
{
  var x = 0.6
  if (action == 'show')
  {
    Effect.SlideDown("comment-"+id, {
      duration: 0.5,
      transition: Effect.Transitions.linear,
      from: 0.0,
      to: x
      });

    document.getElementById("clink-"+id).href= "javascript:display('hide', "+id+")";
    document.getElementById("clink-"+id).innerHTML = "Hide";
  }

  if (action == 'hide')
  {
    Effect.Fade("comment-"+id, {duration: 0.5});
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

/* Fix tinyMCE + AJAX bug
 */
function saveMCE()
{
    tinyMCE.activeEditor.save();
}

/* Clear currently shown in the post comments area errors shown
 */
function clearErrors()
{
    document.getElementById("error-messages").innerHTML = '';
}