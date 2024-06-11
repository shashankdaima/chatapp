// web/web_socket.js

class WebSocketClient {
    constructor(url) {
        this.url = url;
        this.websocket = null;
    }

    connect() {
        this.websocket = new WebSocket(this.url);

        this.websocket.onopen = (event) => {
            console.log("WebSocket is open now.");
        };

        this.websocket.onmessage = (event) => {
            // Send the message to Flutter
            if (window.webSocketCallback) {
                window.webSocketCallback(event.data);
            }
        };

        this.websocket.onclose = (event) => {
            console.log("WebSocket is closed now.");
        };

        this.websocket.onerror = (error) => {
            console.log("WebSocket error: " + error.message);
        };
    }

    send(message) {
        if (this.websocket && this.websocket.readyState === WebSocket.OPEN) {
            this.websocket.send(message);
        } else {
            console.log("WebSocket is not open.");
        }
    }

    close() {
        if (this.websocket) {
            this.websocket.close();
        }
    }
}

window.webSocketClient = new WebSocketClient('wss://echo.websocket.org');

window.startWebSocket = function() {
    window.webSocketClient.connect();
};

window.sendWebSocketMessage = function(message) {
    window.webSocketClient.send(message);
};

window.closeWebSocket = function() {
    window.webSocketClient.close();
};
