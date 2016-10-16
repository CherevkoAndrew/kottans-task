
function s(f) {
  //check destroy option
  let hh = document.getElementById('hh').value;
  let mm = document.getElementById('mm').value;
  let ss = document.getElementById('ss').value;
  let limit = document.getElementById('limit').value;

  if(!(hh || mm || ss || limit)){
    document.getElementById('info').innerHTML = '*select at least one destruction option';
    return ;
  }

  //encrypt
  let secret = document.getElementById('secret').value;
  if(!secret){
    document.getElementById('info').innerHTML = '*enter your secret password';
    return;
  }
  document.getElementById('secret').value = '';
  var crypt = new Crypt();

  document.getElementById('message').value = crypt.AES.encrypt(document.getElementById('message').value, secret);
  f.submit();
}
