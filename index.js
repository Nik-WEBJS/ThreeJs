import * as THREE from "three";
import { OrbitControls } from "three/examples/jsm/controls/OrbitControls";

// Создаем сцену
const scene = new THREE.Scene();
const camera = new THREE.PerspectiveCamera(
  75,
  window.innerWidth / window.innerHeight,
  0.1,
  1000
);

const renderer = new THREE.WebGLRenderer({ antialias: true });
renderer.setSize(window.innerWidth, window.innerHeight);
document.body.appendChild(renderer.domElement);

// Текстура Земли
const textureLoader = new THREE.TextureLoader();
const earthTexture = textureLoader.load("./Albedo.jpg");
earthTexture.wrapS = THREE.ClampToEdgeWrapping;
earthTexture.wrapT = THREE.ClampToEdgeWrapping;

const earthGeometry = new THREE.SphereGeometry(5, 64, 64);
const earthMaterial = new THREE.MeshStandardMaterial({ map: earthTexture });

const earth = new THREE.Mesh(earthGeometry, earthMaterial);
scene.add(earth);

// Свет
const ambientLight = new THREE.AmbientLight(0xffffff, 0.5); // Мягкий белый свет
scene.add(ambientLight);
const pointLight = new THREE.PointLight(0xffffff, 1);
pointLight.position.set(0, 0, 0); // В центре сферы
scene.add(pointLight);

// Управление камерой
const controls = new OrbitControls(camera, renderer.domElement);
camera.position.z = 12;
controls.enableDamping = true;

// Функция для добавления точки по координатам
function addMarker(lat, lon) {
  const radius = 5.05;
  const phi = THREE.MathUtils.degToRad(90 - lat);
  const theta = THREE.MathUtils.degToRad(-lon);

  const x = radius * Math.sin(phi) * Math.cos(theta);
  const y = radius * Math.cos(phi);
  const z = radius * Math.sin(phi) * Math.sin(theta);

  const markerGeometry = new THREE.SphereGeometry(0.1, 16, 16);
  const markerMaterial = new THREE.MeshBasicMaterial({ color: 0xff0000 });
  const marker = new THREE.Mesh(markerGeometry, markerMaterial);
  marker.position.set(x, y, z);
  scene.add(marker);
}

// Форма для ввода координат
const form = document.createElement("div");
form.innerHTML = `
    <input id="lat" type="number" placeholder="Широта" step="0.01"> 
    <input id="lon" type="number" placeholder="Долгота" step="0.01">
    <button id="addMarker">Добавить</button>
`;
form.style.position = "absolute";
form.style.top = "10px";
form.style.left = "10px";
document.body.appendChild(form);

document.getElementById("addMarker").addEventListener("click", () => {
  const lat = parseFloat(document.getElementById("lat").value);
  const lon = parseFloat(document.getElementById("lon").value);
  if (!isNaN(lat) && !isNaN(lon)) {
    addMarker(lat, lon);
  }
});

// Анимация сцены
function animate() {
  requestAnimationFrame(animate);
  renderer.render(scene, camera);
}
animate();
