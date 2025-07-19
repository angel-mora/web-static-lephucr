---
title: Sort Spotify Liked Songs
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Sort Spotify Liked Songs

## ✅ TODOs


## 📌 Summary
Api query to sort all my songs liked by bpm from Spotify in JavaScript

## 🧠 Full Chat


Api query to sort all my songs liked by bpm from Spotify in JavaScript 

To sort your liked songs by BPM (beats per minute) from Spotify using JavaScript, you'll need to utilize the Spotify Web API. Here's a step-by-step guide:

1. **Setting Up Your App & Getting Authorization**:
   
   Before you can make requests to the Spotify API, you need to set up an application in the Spotify Developer Dashboard and get an access token. 

   - Go to the Spotify Developer Dashboard and log in.
   - Click 'Create an App'.
   - Once your app is created, you'll be provided with a Client ID and Client Secret. Keep these safe.

2. **Get Authorization Token**:
   
   For the sake of this example, we'll use the Implicit Grant Flow. This is suitable for client-side apps without a backend.

```javascript
const clientId = 'YOUR_CLIENT_ID';
const redirectUri = 'YOUR_REDIRECT_URI'; // e.g., http://localhost:3000/
const scopes = 'user-library-read';

window.location = `https://accounts.spotify.com/authorize?client_id=${clientId}&response_type=token&scope=${encodeURIComponent(scopes)}&redirect_uri=${encodeURIComponent(redirectUri)}`;
```

3. **Fetch Liked Songs & Sort by BPM**:

Once you have an access token (after user authentication), you can fetch the user's liked songs. We then sort these songs by BPM.

```javascript
const accessToken = 'YOUR_ACCESS_TOKEN'; // Extract from URL after redirection.

async function getLikedSongs() {
    const endpoint = 'https://api.spotify.com/v1/me/tracks?limit=50'; // Limit of 50 tracks per request.
    const response = await fetch(endpoint, {
        headers: {
            'Authorization': `Bearer ${accessToken}`
        }
    });

    const data = await response.json();
    return data.items;
}

async function sortSongsByBPM() {
    const songs = await getLikedSongs();
    const sortedSongs = songs.sort((a, b) => {
        const bpmA = a.track.tempo;
        const bpmB = b.track.tempo;
        return bpmA - bpmB;
    });
    
    return sortedSongs;
}
```

Note: The above example assumes that each track object contains a `tempo` field. The Spotify API does not directly provide the `tempo` for tracks in the "liked songs" endpoint. You might need to make an additional request to the audio features endpoint for each track to get the tempo. Ensure to modify the sorting function to account for this additional data fetching step.

Remember to handle potential pagination as the `getLikedSongs` function above only fetches 50 songs at a time. If the user has more than 50 liked songs, you'll need to account for pagination by using the `offset` query parameter in your requests to the Spotify API.

Do not assume. Does it have the functionality?

Sorry for the oversight. Let me clarify.

The Spotify Web API does **not** include the `tempo` (or BPM) within the data when you fetch liked songs directly. To get this information, you need to use the `audio-features` endpoint for each track.

Here's how you can adjust the process:

1. **Fetch Liked Songs**:
Fetch the user's liked songs as previously described.

2. **Get Audio Features for Each Track**:
For each song you fetch, you'll need to get its audio features to retrieve the `tempo`.

```javascript
async function getAudioFeatures(trackId) {
    const endpoint = `https://api.spotify.com/v1/audio-features/${trackId}`;
    const response = await fetch(endpoint, {
        headers: {
            'Authorization': `Bearer ${accessToken}`
        }
    });

    const data = await response.json();
    return data;
}
```

3. **Fetch and Sort by BPM**:

```javascript
async function sortSongsByBPM() {
    const songs = await getLikedSongs();
    const songsWithFeatures = await Promise.all(songs.map(async (song) => {
        const features = await getAudioFeatures(song.track.id);
        return {
            ...song.track,
            tempo: features.tempo
        };
    }));
    
    const sortedSongs = songsWithFeatures.sort((a, b) => a.tempo - b.tempo);
    return sortedSongs;
}
```

This approach, though straightforward, is not optimal if you have a large number of liked songs. Fetching the audio features for each track individually can be inefficient due to rate limits. Instead, you can batch multiple track IDs into a single request using the `audio-features?ids={ids}` endpoint, where `{ids}` is a comma-separated list of track IDs. The maximum number of track IDs you can request at once is 100. Ensure to chunk and manage requests accordingly to stay efficient and respect rate limits.