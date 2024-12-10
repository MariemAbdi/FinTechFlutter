'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter.js": "7d69e653079438abfbb24b82a655b0a4",
"main.dart.js": "2247181206d1c69a6df070578d6092fd",
"assets/FontManifest.json": "3ddd9b2ab1c2ae162d46e3cc7b78ba88",
"assets/AssetManifest.bin": "27337668c405f82b1b526f3cbd843b87",
"assets/fonts/MaterialIcons-Regular.otf": "27ab397f1d9653a964bf42df029b75f1",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "81aba8e043edd39fc4f91924587ee4a3",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "04f83c01dded195a11d21c2edf643455",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "dd955a76d75af23521bb7957d5596117",
"assets/assets/header_secondary_image.png": "c8460b295c68c9c2aed21d2a044a0ee4",
"assets/assets/debit_20background.jpg": "41098693593a6a4e9f5153e8f201330a",
"assets/assets/digital%2520payment.png": "5c62b3b6ae9c05a62fd162fe9a067bcc",
"assets/assets/money%2520jar.jpg": "816a15bcadb860e6b7d05a23c993a29d",
"assets/assets/debit%2520cards.png": "ffa6ae9a5a9c4168dab624e04e46591e",
"assets/assets/open%2520banking.png": "c2264de456955c7f09c0bb521a7fb6ae",
"assets/assets/shape.png": "12f0582d3d1c80f3c23445af7651e710",
"assets/assets/loan%2520management.png": "357223cdf5eb6184f6d12f89210e1dfe",
"assets/assets/flower.png": "e33c11744a405b8228e9c82aaea64532",
"assets/assets/digital_20payment.png": "5c62b3b6ae9c05a62fd162fe9a067bcc",
"assets/assets/star.png": "ba0d6f8fc5a62a69bf2ff0841c9aacd1",
"assets/assets/debit_20cards.png": "ffa6ae9a5a9c4168dab624e04e46591e",
"assets/assets/loan_20management.png": "357223cdf5eb6184f6d12f89210e1dfe",
"assets/assets/goal_20tracking.png": "1d84c4b51d2f0242f7d3f99b845af78b",
"assets/assets/Placeholder.png": "535fd5af76d8463ce24a1ad468671d0e",
"assets/assets/fireworks.png": "c5f89a334656058ec8d7be5b2ec78a35",
"assets/assets/header_image.png": "dfa6d31b117357c328b1696a9c112386",
"assets/assets/money_20jar.jpg": "816a15bcadb860e6b7d05a23c993a29d",
"assets/assets/goal%2520tracking.png": "1d84c4b51d2f0242f7d3f99b845af78b",
"assets/assets/open_20banking.png": "c2264de456955c7f09c0bb521a7fb6ae",
"assets/assets/logo.png": "39cd8753a1de44a33a42e7f312e99b92",
"assets/assets/debit%2520background.jpg": "41098693593a6a4e9f5153e8f201330a",
"assets/NOTICES": "d28c8f1b6771031c11079617114bfa9c",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"assets/AssetManifest.json": "82f75bc2aee117dc36c5ac66f39d2d9e",
"assets/AssetManifest.bin.json": "2c600e20581e43cae32d94cd669e8351",
"index.html": "4f142b41c31a78e8c04cba297de03038",
"/": "4f142b41c31a78e8c04cba297de03038",
"manifest.json": "90e4318a22f86ecfe357229a10d7edad",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/chromium/canvaskit.wasm": "143af6ff368f9cd21c863bfa4274c406",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/canvaskit.wasm": "73584c1a3367e3eaf757647a8f5c5989",
"canvaskit/skwasm.wasm": "2fc47c0a0c3c7af8542b601634fe9674",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"icons/Icon-maskable-192.png": "9c58cab32d51ff8ba64491974eca5c16",
"icons/Icon-192.png": "9c58cab32d51ff8ba64491974eca5c16",
"icons/Icon-512.png": "5459fe8f91ce976474736c9a77e8e35e",
"icons/Icon-maskable-512.png": "5459fe8f91ce976474736c9a77e8e35e",
"favicon.png": "f83ba3e0c389d9d3bab5243d5989f0fa",
"version.json": "2cbed1e24a68cf43cf7a87c032558aaa"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
