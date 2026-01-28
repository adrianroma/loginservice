# Build stage
FROM golang:1.21-alpine AS builder

WORKDIR /app

# Copy go mod files
COPY go.mod ./

# Download dependencies
RUN go mod download

# Copy source code
COPY . .

# Build the application
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o loginservice .

# Final stage
FROM alpine:latest

# Create non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

WORKDIR /home/appuser

# Copy the binary from builder
COPY --from=builder /app/loginservice .

# Change ownership
RUN chown -R appuser:appgroup /home/appuser

# Switch to non-root user
USER appuser

# Expose port
EXPOSE 8080

# Run the application
CMD ["./loginservice"]
