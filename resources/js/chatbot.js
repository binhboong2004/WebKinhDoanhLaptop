const chatBody = document.querySelector(".chat-body");
const messageInput = document.querySelector(".message-input");
const sendMessageButton = document.querySelector("#send-message");
const chatbotToggler = document.querySelector("#chatbot-toggler");
const closeChatbot = document.querySelector("#close-chatbot");

const initialInputHeight = messageInput.scrollHeight;

// =================================================================
// ===== KHÔNG GỌI TRỰC TIẾP GEMINI NỮA =====
// =================================================================

const createMessageElement = (content, ...classes) => {
    const div = document.createElement("div");
    div.classList.add("message", ...classes);
    div.innerHTML = content;
    return div;
};

// Hàm mới để gửi tin nhắn đến server Laravel của bạn
const generateBotResponse = async (userMessage, incomingMessageDiv) => {
    const messageElement = incomingMessageDiv.querySelector(".message-text");
    
    // URL này trỏ đến server Laravel của bạn, được định nghĩa trong web.php
    const LARAVEL_API_URL = '/chatbot';

    try {
        // Sử dụng axios đã được cấu hình trong bootstrap.js
        // Nó sẽ tự động gửi CSRF token
        const response = await window.axios.post(LARAVEL_API_URL, {
            message: userMessage
        });

        // Lấy câu trả lời từ server Laravel
        const botAnswer = response.data.answer;
        
        // Hiển thị câu trả lời
        // Chúng ta sẽ dùng thư viện Showdown để render Markdown cho đẹp
        const converter = new showdown.Converter();
        messageElement.innerHTML = converter.makeHtml(botAnswer);

    } catch (error) {
        console.error("Lỗi khi gọi đến server Laravel:", error);
        messageElement.innerText = "Xin lỗi, đã có lỗi kết nối đến máy chủ. Vui lòng thử lại sau.";
        messageElement.style.color = "#FF0000";
    } finally {
        // Xóa trạng thái "thinking" sau khi có kết quả
        incomingMessageDiv.classList.remove("thinking");
        chatBody.scrollTo({ top: chatBody.scrollHeight, behavior: "smooth" });
    }
};


const handleOutgoingMessage = (e) => {
    e.preventDefault();
    const userMessage = messageInput.value.trim();
    if (!userMessage) return;

    messageInput.value = "";
    messageInput.dispatchEvent(new Event("input"));

    // Hiển thị tin nhắn của người dùng
    const outgoingMessageDiv = createMessageElement(`<div class="message-text">${userMessage}</div>`, "user-message");
    chatBody.appendChild(outgoingMessageDiv);
    chatBody.scrollTo({ top: chatBody.scrollHeight, behavior: "smooth" });

    // Hiển thị trạng thái "thinking" của bot
    setTimeout(() => {
        const messageContent = `<svg class="bot-avatar" xmlns="http://www.w3.org/2000/svg" width="50" height="50"
                    viewBox="0 0 1024 1024">
                    <path
                        d="M738.3 287.6H285.7c-59 0-106.8 47.8-106.8 106.8v303.1c0 59 47.8 106.8 106.8 106.8h81.5v111.1c0 .7.8 1.1 1.4.7l166.9-110.6 41.8-.8h117.4l43.6-.4c59 0 106.8-47.8 106.8-106.8V394.5c0-59-47.8-106.9-106.8-106.9zM351.7 448.2c0-29.5 23.9-53.5 53.5-53.5s53.5 23.9 53.5 53.5-23.9 53.5-53.5 53.5-53.5-23.9-53.5-53.5zm157.9 267.1c-67.8 0-123.8-47.5-132.3-109h264.6c-8.6 61.5-64.5 109-132.3 109zm110-213.7c-29.5 0-53.5-23.9-53.5-53.5s23.9-53.5 53.5-53.5 53.5 23.9 53.5 53.5-23.9 53.5-53.5 53.5zM867.2 644.5V453.1h26.5c19.4 0 35.1 15.7 35.1 35.1v121.1c0 19.4-15.7 35.1-35.1 35.1h-26.5zM95.2 609.4V488.2c0-19.4 15.7-35.1 35.1-35.1h26.5v191.3h-26.5c-19.4 0-35.1-15.7-35.1-35.1zM561.5 149.6c0 23.4-15.6 43.3-36.9 49.7v44.9h-30v-44.9c-21.4-6.5-36.9-26.3-36.9-49.7 0-28.6 23.3-51.9 51.9-51.9s51.9 23.3 51.9 51.9z">
                    </path>
                </svg>
                <div class="message-text">
                    <div class="thinking-indicator">
                        <div class="dot"></div>
                        <div class="dot"></div>
                        <div class="dot"></div>
                    </div>
                </div>`;
        const incomingMessageDiv = createMessageElement(messageContent, "bot-message", "thinking");
        chatBody.appendChild(incomingMessageDiv);
        chatBody.scrollTo({ top: chatBody.scrollHeight, behavior: "smooth" });
        
        // Gọi hàm để lấy câu trả lời từ server Laravel
        generateBotResponse(userMessage, incomingMessageDiv);
    }, 600);
};

// ============ Các sự kiện lắng nghe (giữ nguyên) =============
messageInput.addEventListener("keydown", (e) => {
    if (e.key === "Enter" && !e.shiftKey && window.innerWidth > 768) {
        handleOutgoingMessage(e);
    }
});

messageInput.addEventListener("input", () => {
    messageInput.style.height = `${initialInputHeight}px`;
    messageInput.style.height = `${messageInput.scrollHeight}px`;
    document.querySelector(".chat-form").style.borderRadius =
        messageInput.scrollHeight > initialInputHeight ? "15px" : "32px";
});

sendMessageButton.addEventListener("click", (e) => handleOutgoingMessage(e));
chatbotToggler.addEventListener("click", () => document.body.classList.toggle("show-chatbot"));
closeChatbot.addEventListener("click", () => document.body.classList.remove("show-chatbot"));

// Thêm thư viện Showdown để render Markdown
// Bạn cần thêm dòng này vào file layout chính của bạn (ví dụ: app.blade.php)
// <script src="https://cdnjs.cloudflare.com/ajax/libs/showdown/2.1.0/showdown.min.js"></script>