//My solutio
function generateHashtag (str) {
  var result = "#";
  if(str.length>1){
    for(var i=0;i<str.split(" ").length;i++){
        result += str.split(" ")[0].charAt(0).toUpperCase() + str.split(" ")[0].slice(1);
    }
    if(result.length>140){
      return false;
    }else{
      return result;
    }
  }else {
    return false;
  }
}


//Best Practise
function generateHashtag (str) {
  return str.length > 140 || str === '' ? false :
    '#' + str.split(' ').map(capitalize).join('');
}

function capitalize(str) {
  return str.charAt(0).toUpperCase() + str.slice(1);
}
