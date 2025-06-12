# Инициализируем git
git init

# Добавляем .gitignore (чтобы не загружать ненужные файлы)
cat > .gitignore << 'EOF'
# Maven
target/
*.war
*.jar

# IDE
.idea/
*.iml

# Docker
*.dockerignore
EOF

# Добавляем README.md (описание проекта)
cat > README.md << 'EOF'
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
