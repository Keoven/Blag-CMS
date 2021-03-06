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

function displayAll(action, cid)
{
  if (action == 'show')
  {
    document.getElementById(cid).style.display = "block";
    document.getElementById("clink").href= "javascript:displayAll('hide', '"+cid+"')";
    document.getElementById("clink").innerHTML = "Hide Comments";
    ch = document.getElementById(cid).children;
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
    document.getElementById(cid).style.display = "none";
    document.getElementById("clink").href = "javascript:displayAll('show', '"+cid+"')";
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

/* Used to change submit to default
 */
var restored = false
function restoreDefaultCommentDivs()
{
  if (!restored && !document.getElementById('error-messages').hasChildNodes())
  {
    document.getElementById('first-comment-post').id = 'temp';
    document.getElementById('blog-comments').id = 'first-comment-post';
    document.getElementById('temp').id = 'blog-comments';
    document.getElementById('clink').href =  "javascript:displayAll('hide', 'first-comment-post')";
    restored = true;
  }
}