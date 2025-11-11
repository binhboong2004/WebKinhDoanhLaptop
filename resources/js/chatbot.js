const chatBody = document.querySelector(".chat-body");
const messageInput = document.querySelector(".message-input");
const sendMessageButton = document.querySelector("#send-message");
const chatbotToggler = document.querySelector("#chatbot-toggler");
const closeChatbot = document.querySelector("#close-chatbot");

// Lấy các nút điều khiển mới
const fileInput = document.querySelector("#file-input");
const fileUploadWrapper = document.querySelector(".file-upload-wrapper");
const fileCancelButton = document.querySelector("#file-cancel");
const fileUploadButton = document.querySelector("#file-upload");
const emojiPickerButton = document.querySelector("#emoji-picker");

// Biến để lưu trữ file (cả File object để gửi và DataURL để preview)
let currentFile = null; 

const initialInputHeight = messageInput.scrollHeight;

const createMessageElement = (content, ...classes) => {
    const div = document.createElement("div");
    div.classList.add("message", ...classes);
    div.innerHTML = content;
    return div;
};

// =========================================================================
// HÀM 1: ĐÃ SỬA - Gửi tin nhắn bằng FormData
// =========================================================================
const generateBotResponse = async (userMessage, incomingMessageDiv, fileObject) => {
    const messageElement = incomingMessageDiv.querySelector(".message-text");
    const LARAVEL_API_URL = '/chatbot'; // URL server Laravel của bạn

    // --- SỬA ĐỔI QUAN TRỌNG ---
    // Tạo payload bằng FormData để gửi file đúng chuẩn
    const formData = new FormData();
    formData.append('message', userMessage);

    if (fileObject) {
        // Key 'image' phải khớp với $request->file('image') trong Laravel
        formData.append('image', fileObject);
    }
    // --- KẾT THÚC SỬA ĐỔI ---

    try {
        // Gửi formData lên server. 
        // Axios sẽ tự động đặt Content-Type là 'multipart/form-data'
        const response = await window.axios.post(LARAVEL_API_URL, formData, {
             headers: {
                // Đảm bảo axios gửi đúng định dạng
                'Content-Type': 'multipart/form-data'
            }
        });

        const botAnswer = response.data.answer;
        
        const converter = new showdown.Converter();
        messageElement.innerHTML = converter.makeHtml(botAnswer);

    } catch (error) {
        console.error("Lỗi khi gọi đến server Laravel:", error);
        if (error.response && error.response.status === 422) {
             // Lỗi validation (ví dụ: file quá lớn)
             messageElement.innerText = "Lỗi: File ảnh không hợp lệ hoặc quá lớn (tối đa 5MB).";
        } else {
             messageElement.innerText = "Xin lỗi, đã có lỗi kết nối đến máy chủ. Vui lòng thử lại sau.";
        }
        messageElement.style.color = "#FF0000";
    } finally {
        incomingMessageDiv.classList.remove("thinking");
        chatBody.scrollTo({ top: chatBody.scrollHeight, behavior: "smooth" });
    }
};

// =========================================================================
// HÀM 2: ĐÃ SỬA - Xử lý gửi tin (tách File object và DataURL)
// =========================================================================
const handleOutgoingMessage = (e) => {
    e.preventDefault();
    const userMessage = messageInput.value.trim();
    
    // Chỉ gửi khi có tin nhắn text hoặc file ảnh
    if (!userMessage && !currentFile) return;

    messageInput.value = "";
    messageInput.dispatchEvent(new Event("input"));
    
    // Hiển thị tin nhắn người dùng (kèm ảnh nếu có)
    const messageContent = 
        `<div class="message-text">${userMessage}</div>` + 
        // Lấy dataUrl từ object currentFile để preview
        (currentFile ? `<img src="${currentFile.dataUrl}" class="attachment" />` : "");

    const outgoingMessageDiv = createMessageElement(messageContent, "user-message");
    chatBody.appendChild(outgoingMessageDiv);
    chatBody.scrollTo({ top: chatBody.scrollHeight, behavior: "smooth" });

    // Đặt lại UI file
    fileUploadWrapper.classList.remove("file-uploaded");
    
    // Chỉ lấy File object để gửi đi
    const fileToSend = currentFile ? currentFile.file : null; 
    currentFile = null; // Xóa file khỏi biến global

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
        
        // Gửi tin nhắn và File object (nếu có) cho bot
        generateBotResponse(userMessage, incomingMessageDiv, fileToSend);
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

// =========================================================================
// HÀM 3: ĐÃ SỬA - Logic tải file (Lưu cả File object và DataURL)
// =========================================================================
fileUploadButton.addEventListener("click", () => fileInput.click());

fileInput.addEventListener("change", () => {
    const file = fileInput.files[0]; // Lấy File object
    if (!file) return;

    // Kiểm tra định dạng file (chỉ cho phép ảnh)
    if (!file.type.startsWith('image/')) {
        alert('Chỉ hỗ trợ tải lên file ảnh (jpeg, png, jpg, webp).');
        fileInput.value = ""; // Xóa input
        return;
    }

    const reader = new FileReader();
    reader.onload = (e) => {
        const dataUrl = e.target.result; // Lấy DataURL (base64)
        fileUploadWrapper.querySelector("img").src = dataUrl;
        fileUploadWrapper.classList.add("file-uploaded");

        // Lưu cả File object (để gửi) và DataURL (để preview)
        currentFile = {
            file: file,
            dataUrl: dataUrl 
        };

        fileInput.value = ""; // Xóa input để có thể chọn lại file tương tự
    }

    reader.readAsDataURL(file);
});

fileCancelButton.addEventListener("click", () => {
    currentFile = null; // Xóa file
    fileUploadWrapper.classList.remove("file-uploaded");
});

// ===== LOGIC XỬ LÝ EMOJI PICKER (giữ nguyên) =====
const picker = new EmojiMart.Picker({
    theme: "light",
    skinTonePosition: "none",
    previewPosition: "none",
    onEmojiSelect: (emoji) => {
        const { selectionStart: start, selectionEnd: end } = messageInput;
        messageInput.setRangeText(emoji.native, start, end, "end");
        messageInput.focus();
        document.body.classList.remove("show-emoji-picker");
    },
    onClickOutside: (e) => {
        if (e.target.id === "emoji-picker") {
            document.body.classList.toggle("show-emoji-picker");
        } else if (!picker.contains(e.target) && e.target.id !== "emoji-picker") {
            document.body.classList.remove("show-emoji-picker");
        }
    }
});
document.querySelector(".chat-form").appendChild(picker);