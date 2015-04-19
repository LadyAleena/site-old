/*******************************************************************
 *  Credits go to: (all members in irc.freenode.net ##javascript   *
 *    inimino (complete adjustments)                               *
 *    Maggi (lots of troubleshooting help)                         *
 *    Typos_King (input on troubleshooting)                        *
 *    Mordof (compiling final efforts into this document)          *
 *******************************************************************/

function list_onclick(e)
{
	e=e||event;
	var elm = e.target || e.srcElement;
	if(elm.nodeType!=1) elm=elm.parentNode;

	var parent = getAncestor(elm,'tagName',/^(LI|OL|UL)$/i);
	if(parent) toggleClassPair(parent, 'open', 'closed');
}

function getAncestor(elm, prop, regVal, excludeElm)
{
	if(excludeElm) elm = elm.parentNode;
	while(elm)
	{
		if(regVal.test(elm[prop])) 
			return elm;
		elm = elm.parentNode;
	}
}

/* written by robdubya in irc.freenode.net ##javascript */
function toggleClassPair(elm, class1, class2)
{
	elm.className = elm.className.replace(new RegExp('\\b('+class1+'|'+class2+')\\b','g'),function(found){ return found==class1? class2:class1;});
}

function toggleClassPair(elm, class1, class2)
{
	elm.className = elm.className.replace(new RegExp('\\b('+class1+'|'+class2+')\\b','g'),function(found){ return found==class1? class2:class1;});
}
function registerListeners(){
  console.log($)
 
  /* single toggles written by cjohnson in irc.freenode.net ##javascript*/
  $('ol.faq').on('click', 'a.toggle', function() {
    $(this).closest('li').find('span').toggleClass('hide');
    return false;
  });

}

/* found on the net */
/* toggles */
function toggle_block(id) {
  var e = document.getElementById(id);
  if(e.style.display == 'block')
    e.style.display = 'none';
  else
    e.style.display = 'block';
}

function toggle_inline(id) {
  var e = document.getElementById(id);
  if(e.style.display == 'inline')
    e.style.display = 'none';
  else
    e.style.display = 'inline';
}

$(document).ready(registerListeners) /* goes with line 31 - 47 */
