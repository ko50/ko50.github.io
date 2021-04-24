'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "index.html": "816f826731162191c1765d1f211d837e",
"/": "816f826731162191c1765d1f211d837e",
"manifest.json": "4336da5234296c3e92a8c5dae2420788",
"main.dart.js": "54021efd4f93a5ae7f485b54f9f91495",
"assets/images/works/Portfolio.png": "fb21c52f179f5aa6e2d66c8df8c84ab2",
"assets/images/cotton_circle.png": "8d73fba78ea832930fb9586e8205c213",
"assets/images/contacts/Twitter.svg": "5c23880d6c21f45e5e8581fde45a89a1",
"assets/images/contacts/GitHub.svg": "ce89173e3842fb91835a9cc8605a5ecc",
"assets/images/skills/React.svg": "84287d09b8053c6fa598893b8910786a",
"assets/images/skills/TypeScript.svg": "c87187cad0ab07cb31c76fb8facda1e1",
"assets/images/skills/Flutter.svg": "bd9fec894dfe707631e11a1dfedb25b5",
"assets/images/skills/Git.svg": "e17d9d39080741df8d38c22e60a369c4",
"assets/images/skills/Dart.svg": "ef26b12cc0b34cc83dfcde04e8bb1ea1",
"assets/images/skills/Python.svg": "fbef321e03c16bcae42560f8507757d6",
"assets/images/skills/GitHub.svg": "ce89173e3842fb91835a9cc8605a5ecc",
"assets/NOTICES": "e071f2af0fd23354313220862ceb4e6c",
"assets/fonts/Roboto-Medium.ttf": "58aef543c97bbaf6a9896e8484456d98",
"assets/fonts/Roboto-Light.ttf": "88823c2015ffd5fa89d567e17297a137",
"assets/fonts/Roboto-Regular.ttf": "11eabca2251325cfc5589c9c6fb57b46",
"assets/fonts/Roboto-Bold.ttf": "e07df86cef2e721115583d61d1fb68a6",
"assets/fonts/MaterialIcons-Regular.otf": "1288c9e28052e028aba623321f7826ac",
"assets/fonts/Roboto-Thin.ttf": "321de678e592d0b8f44f1a82d7ca4b62",
"assets/fonts/Roboto-Black.ttf": "5ebb24ee1112dd9562629375c387879a",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/assets/images/works/Portfolio.png": "fb21c52f179f5aa6e2d66c8df8c84ab2",
"assets/assets/images/cotton_circle.png": "8d73fba78ea832930fb9586e8205c213",
"assets/assets/images/contacts/Twitter.svg": "5c23880d6c21f45e5e8581fde45a89a1",
"assets/assets/images/contacts/GitHub.svg": "ce89173e3842fb91835a9cc8605a5ecc",
"assets/assets/images/skills/React.svg": "84287d09b8053c6fa598893b8910786a",
"assets/assets/images/skills/TypeScript.svg": "c87187cad0ab07cb31c76fb8facda1e1",
"assets/assets/images/skills/Flutter.svg": "bd9fec894dfe707631e11a1dfedb25b5",
"assets/assets/images/skills/Git.svg": "e17d9d39080741df8d38c22e60a369c4",
"assets/assets/images/skills/Dart.svg": "ef26b12cc0b34cc83dfcde04e8bb1ea1",
"assets/assets/images/skills/Python.svg": "fbef321e03c16bcae42560f8507757d6",
"assets/assets/images/skills/GitHub.svg": "ce89173e3842fb91835a9cc8605a5ecc",
"assets/FontManifest.json": "85e4a8d67b6378dbf543a8cc101107b6",
"assets/AssetManifest.json": "0f7a585497cf25da7730d6fddfb9010a",
"version.json": "426313f2f3133c2f20415344c4a22df3"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value + '?revision=' + RESOURCES[value], {'cache': 'reload'})));
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
