export function twoFer(name){
  name = (typeof name !== 'undefined') ? name : ''
  if (name !== "") {
    return "One for " + name + ", one for me.";
  }
  else {
    return "One for you, one for me.";
  }
}

