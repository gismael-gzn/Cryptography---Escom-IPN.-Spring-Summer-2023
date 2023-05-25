function requestDownload(target) {
  const currentPath = window.location.pathname;
  const pathSegments = currentPath.split('/');
  pathSegments.pop();
  const parentPath = pathSegments.join('/');

  const formData = new FormData();
  formData.append('target', target);

  fetch(`${parentPath}/`, {
    method: 'POST',
    body: formData
  })
    .then(response => response.text()) // Adjust the response handling if necessary
    .then(data => console.log(data))
    .catch(error => console.error(error));
}



window.addEventListener('DOMContentLoaded', () => {
  const navbar = document.getElementById('mobile-menu');
  const sticky = navbar.offsetTop;

  const scrollHandler = () => {
    if (window.pageYOffset >= sticky) {
      navbar.classList.add('sticky');
    } else {
      navbar.classList.remove('sticky');
    }
  };

  window.addEventListener('scroll', scrollHandler);
});

window.addEventListener('DOMContentLoaded', () => {
  const navbar = document.getElementById('navigation');

  const forceNavDisplay = () => {
    if(navbar.style.display === 'none' && window.innerWidth > 960) {
      navbar.style.display = 'block';
    }
  };

  window.addEventListener('resize', forceNavDisplay);
});

function responsiveTextContentChange() {
  const email = document.getElementById('my-mail');

  if(window.innerWidth <= 960) {
    email.innerHTML = 'Email';
  }
  else {
    email.innerHTML = 'ggarzond1600@alumno.ipn.mx';
  }
}

window.addEventListener('DOMContentLoaded', () => {
  responsiveTextContentChange();
});


window.addEventListener('DOMContentLoaded', () => {
  window.addEventListener('resize', responsiveTextContentChange);
});

function close_nav() {
    if (window.innerWidth > 960)
      return;
    const navigation = document.getElementById('navigation')
    navigation.style.display = 'none';
  }

function open_nav() {
    const navigation = document.getElementById('navigation')
    navigation.style.display = 'block';
  }

function open_main() {
    const menu = document.getElementById('main-menu')
    menu.style.visibility = 'visible'
  }

function close_main() {
    const menu = document.getElementById('main-menu')
    menu.style.visibility = 'hidden'
  }
