# Belarus Time Clock

A simple fullscreen clock showing current Belarus time (UTC+3) with 12/24 hour format toggle.

## Features
- Real-time updating
- Timezone correction to UTC+3
- Toggle between 12/24 hour formats
- Clean, responsive design

## How to run
```bash
docker build -t belarus-clock .
docker run -p 8080:8080 belarus-clock
