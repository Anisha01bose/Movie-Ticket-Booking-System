const images = [
    'Anisha Photo.jpg',
  'Layer 1.png',
  'Layer 2.png',
  'Layer 3.png'
];

let currentIndex = 0;
const slideshowElement = document.querySelector('.slideshow');

function showNextImage() {
  if (currentIndex === images.length) {
    currentIndex = 0;
  }

  const imageUrl = images[currentIndex];
  const imageElement = document.createElement('img');
  imageElement.src = imageUrl;

  slideshowElement.innerHTML = '';
  slideshowElement.appendChild(imageElement);

  currentIndex++;

  setTimeout(showNextImage, 5000);
}

showNextImage();
