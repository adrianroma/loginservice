# Login Service

A simple login service built with Go that provides authentication endpoints.

## Features

- RESTful API for user authentication
- Health check endpoint
- Docker support for easy deployment
- Lightweight and fast

## Endpoints

### POST /login
Authenticate a user with username and password.

**Request Body:**
```json
{
  "username": "admin",
  "password": "password"
}
```

**Response (Success):**
```json
{
  "success": true,
  "message": "Login successful",
  "token": "demo-token-123456"
}
```

**Response (Failure):**
```json
{
  "success": false,
  "message": "Invalid credentials"
}
```

### GET /health
Check the health status of the service.

**Response:**
```json
{
  "status": "healthy"
}
```

## Running Locally

### Prerequisites
- Go 1.21 or higher

### Build and Run
```bash
go build -o loginservice
./loginservice
```

The service will start on port 8080 by default. You can change this by setting the `PORT` environment variable:
```bash
PORT=3000 ./loginservice
```

## Running with Docker

### Build Docker Image
```bash
docker build -t loginservice .
```

### Run Docker Container
```bash
docker run -p 8080:8080 loginservice
```

### Using Docker Compose
```bash
docker-compose up -d
```

To stop the service:
```bash
docker-compose down
```

## Testing

Test the login endpoint:
```bash
curl -X POST http://localhost:8080/login \
  -H "Content-Type: application/json" \
  -d '{"username":"admin","password":"password"}'
```

Test the health endpoint:
```bash
curl http://localhost:8080/health
```

## Security Considerations

⚠️ **WARNING**: This is a demonstration project and includes the following security limitations:

- **Hardcoded credentials**: The username and password are hardcoded in the source code for demonstration purposes only
- **Static tokens**: Authentication tokens are static and not cryptographically secure
- **No rate limiting**: The login endpoint is vulnerable to brute force attacks
- **HTTP only**: Credentials are transmitted in plain text without TLS/HTTPS
- **No persistent storage**: User credentials and sessions are not stored in a database

**Before using in production:**
1. Implement proper credential storage (database, LDAP, OAuth, etc.)
2. Use secure token generation (JWT with proper signing, or secure random tokens)
3. Add rate limiting to prevent brute force attacks
4. Use HTTPS/TLS (either directly or via reverse proxy like nginx)
5. Implement proper session management and token invalidation
6. Add logging and monitoring for security events

## Configuration

The service can be configured using environment variables:

- `PORT`: The port the service listens on (default: 8080)

## Development

### Project Structure
```
.
├── main.go           # Main application code
├── go.mod           # Go module definition
├── Dockerfile       # Docker image definition
├── docker-compose.yml # Docker Compose configuration
└── README.md        # This file
```

## License

This project is open source and available under the MIT License.
