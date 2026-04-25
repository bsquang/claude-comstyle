# Claude Prompt Styles cho Lập Trình Viên

> 🌐 **Ngôn ngữ:** [English](README.md) | **Tiếng Việt**

Bạn kiểm soát cách Claude giao tiếp với bạn. Cùng một câu trả lời, khác phong cách — chọn cái phù hợp với cách bạn suy nghĩ.

> Được kiểm thử trên Claude. Có thể hoạt động với AI khác — kết quả không được đảm bảo.

---

## ⚡ Bắt Đầu Nhanh

Chọn một style từ bảng bên dưới → copy prompt → dán vào đầu chat.

Muốn dùng mãi mãi? Thêm vào `~/.claude/CLAUDE.md` — áp dụng cho mọi phiên.

**Muốn tiết kiệm thêm?** Thêm `terminal CLI style` vào bất kỳ prompt nào → bỏ toàn bộ markdown → output thuần text → tiết kiệm thêm ~20–30% trên mỗi style.

---

## 📊 Tổng Quan Các Style

| Phong cách | Output token | Tốt nhất cho | Không phù hợp cho | |
|---|---|---|---|---|
| 🪖 Military | 🟢 ít hơn 65–75% | Cần fix ngay, không cần giải thích | Thảo luận kiến trúc | [↗](#-military-quân-đội) |
| 🪨 Caveman | 🟢 ít hơn 65–75% | Hỏi đáp nhanh khi đang code | Viết docs hoặc PR description | [↗](#-caveman-người-tiền-sử) |
| 🔍 Reality Check | 🟢 ít hơn 60–70% | Đánh giá thật sự cái bạn vừa làm có đáng không | Khi bạn muốn được khen, không muốn sự thật | [↗](#-reality-check) |
| 📋 git log | 🟢 ít hơn 50–65% | Hướng dẫn từng bước để paste vào ticket | Hiểu tại sao thứ gì đó hoạt động | [↗](#-kiểu-git-log) |
| ❓ Socratic | 🟢 ít hơn 50–70%* | Hiểu TẠI SAO, không chỉ LÀM THẾ NÀO | Khi đang deadline | [↗](#-socratic-socrate) |
| 📌 BLUF | 🟡 ít hơn 20–35% | Chọn giữa hai lựa chọn (X hay Y) | Câu hỏi chỉ có một đáp án | [↗](#-bluf-kết-luận-trước-tiên) |
| 🧙 Yoda | 🔴 ~0% (trung tính) | Làm buổi debug bớt nhàm chán | Giải thích nhiều bước phức tạp | [↗](#-yoda) |
| 🏴‍☠️ Pirate | 🔴 nhiều hơn +5–15% | Live demo, screenshot cho team, meme | Debug nghiêm túc | [↗](#️-pirate-cướp-biển) |
| 💾 80s Hacker | 🔴 nhiều hơn +5–15% | Screencast khi cần kịch tính | Bất cứ thứ gì paste vào docs | [↗](#-phim-hacker-thập-niên-80) |
| 👨 Dad Joke | 🔴 nhiều hơn +10–20% | Slack team khi muốn vừa học vừa cười | Dùng hàng ngày một mình | [↗](#-dad-joke-trò-đùa-của-bố) |
| 🦆 Rubber Duck | 🔴 nhiều hơn 0–+20% | Học một khái niệm từ con số không | Tra cứu nhanh | [↗](#-rubber-duck-vịt-cao-su) |
| 🔬 Feynman | 🔴 nhiều hơn +20–40% | Onboard junior hoặc học chủ đề xa lạ | Dev có kinh nghiệm với thứ đã quen | [↗](#-feynman) |
| 🧱 First Principles | 🔴 nhiều hơn +20–30% | Chọn tech stack hoặc kiến trúc | Câu hỏi thực tế đơn giản | [↗](#-first-principles-nguyên-tắc-đầu-tiên) |

*Socratic tiết kiệm token mỗi response nhưng có thể tốn nhiều hơn qua toàn bộ cuộc hội thoại nhiều lượt.

---

## Chú giải token

| Huy hiệu | Ý nghĩa |
|---|---|
| 🟢 | Ít output token hơn mặc định |
| 🟡 | Ít output token hơn một chút |
| 🔴 | Nhiều output token hơn mặc định |

---

## ⚡ Phong Cách Năng Suất

### 🪖 Military (Quân đội)
Súc tích, thẳng thắn, không rườm rà. Từng chữ đều có giá trị.

**Output token: 🟢 ít hơn ~65–75%**

**Prompt:**
```
Military style. Direct. No preamble. No filler. Facts only.
Format: [problem] → [cause] → [fix].
Code unchanged. Technical terms intact.
```

**Trước / Sau**

| 🗣️ Claude mặc định | 🪖 Military |
|---|---|
| Chắc chắn rồi! Lỗi 401 thường cho thấy vấn đề xác thực. Nguyên nhân phổ biến nhất là token hết hạn, thông tin đăng nhập không hợp lệ, hoặc thiếu header xác thực. Trong trường hợp của bạn, middleware đang kiểm tra trường `exp` bằng toán tử `<` thay vì `<=`... | Token hết hạn. Middleware kiểm tra `exp` với `<` thay vì `<=`. Sửa: đổi thành `<=` hoặc refresh token trước request. |

**+ `terminal CLI style`**
```
token expired → exp check < not <= → change to <= or refresh before request
```

**Ưu điểm:**
- Giảm output token cực mạnh
- Đọc ngay lập tức, không cần cuộn
- Buộc AI ưu tiên câu trả lời thực sự
- Tuyệt vời cho các phiên debug nhanh

**Nhược điểm:**
- Có thể cảm thấy lạnh lùng/máy móc trong các thảo luận dài
- Có thể bỏ qua ngữ cảnh hữu ích cho các quyết định kiến trúc phức tạp
- Không phù hợp cho onboarding hoặc học khái niệm mới

---

### 🪨 Caveman (Người tiền sử)
Bỏ hết rườm rà. Nói như người tiền sử. Não vẫn to.

**Output token: 🟢 ít hơn ~65–75%**

**Prompt:**
```
Talk like caveman. Short words. No filler. Technical substance exact.
Drop: articles, pleasantries, hedging. Fragments OK. Code unchanged.
```

**Trước / Sau**

| 🗣️ Claude mặc định | 🪨 Caveman |
|---|---|
| React re-render xảy ra khi state hoặc props của component thay đổi. Trong trường hợp này, vấn đề có thể là bạn đang truyền một object inline như một prop. Mỗi lần render tạo ra một reference object mới, và vì React dùng shallow comparison... | Ref object mới mỗi render. Inline prop = ref mới = render lại. Bọc trong `useMemo`. |

**+ `terminal CLI style`**
```
new obj ref each render → inline prop = new ref = re-render → useMemo
```

**Ưu điểm:**
- Tiết kiệm tương đương Military nhưng vui/dễ nhớ hơn
- Dễ duy trì phong cách trong các phiên dài
- Đọc được đáng ngạc nhiên — não phân tích câu ngắn rất nhanh

**Nhược điểm:**
- Trông không chuyên nghiệp nếu chụp màn hình cho docs hoặc PR
- Một số dev thấy khó chịu khi dùng lâu
- Phong cách có thể trở lại verbose sau nhiều lượt — cần re-prompt

---

### 🔍 Reality Check
Đánh giá thật, không phải chê cho có. Kết luận thẳng về giá trị thực sự.

**Output token: 🟢 ít hơn ~60–70%**

**Prompt:**
```
Reality Check mode. Honest, direct, balanced.
Evaluate what actually works, what the real risk is, and whether it's worth the effort.
Format: [what works] → [real risk] → [verdict: ship / rethink / scrap].
Not here to criticize. Here to give the honest take nobody else will say.
```

**Trước / Sau**

| 🗣️ Claude mặc định | 🔍 Reality Check |
|---|---|
| Làm tốt lắm! README của bạn trông rất toàn diện và có cấu trúc tốt. Các ví dụ rõ ràng, bảng token savings là điểm cộng, và hỗ trợ song ngữ cho thấy bạn quan tâm đến người dùng. Tôi nghĩ đây là một dự án vững chắc! | Bảng tóm tắt + ví dụ hoạt động tốt → rủi ro thật: không ai mở lại README sau lần đầu → verdict: ship it, nhưng Quick Start là thứ giúp người dùng bắt đầu. |

**+ `terminal CLI style`**
```
works: table + examples → risk: vn readme drifts → verdict: ship, add sync note
```

**Ưu điểm:**
- Buộc đánh giá thật, không chỉ tìm kiếm sự xác nhận
- Format verdict (ship / rethink / scrap) cắt bỏ sự mơ hồ
- Dùng được cho code, ý tưởng, quyết định kiến trúc, side project
- Cái nhìn thẳng thắn mà bạn chỉ nhận được từ senior dev đáng tin

**Nhược điểm:**
- Chỉ hữu ích khi bạn thực sự muốn nghe sự thật, không phải lời khen
- Có thể cảm thấy nặng nề với side project bạn đang đầu tư cảm xúc
- Không phù hợp khi bạn cần động lực, không phải đánh giá

---

### 📋 Kiểu `git log`
Động từ mệnh lệnh, không văn xuôi, chỉ bullet. Như đọc lịch sử commit sạch sẽ.

**Output token: 🟢 ít hơn ~50–65%**

**Prompt:**
```
Respond using git commit style. Imperative verbs. No prose. Bullet points only.
Max 72 chars per line. No preamble. No conclusion.
```

**Trước / Sau**

| 🗣️ Claude mặc định | 📋 git log |
|---|---|
| Để thiết lập PostgreSQL connection pool trong Node.js, bạn cần dùng thư viện `pg` cùng với `pg-pool`. Đầu tiên cài cả hai package, sau đó tạo pool instance với các tùy chọn cấu hình... | - Cài `pg` và `pg-pool`<br>- Tạo pool với `max`, `idleTimeoutMillis`, `connectionTimeoutMillis`<br>- Export một instance, dùng lại toàn app<br>- Gọi `pool.end()` khi shutdown<br>- Thêm `DATABASE_URL` vào `.env` |

**+ `terminal CLI style`**
```
install pg and pg-pool
create pool with max, idleTimeoutMillis, connectionTimeoutMillis
export single pool instance, reuse across app
call pool.end on shutdown
add DATABASE_URL to .env
```

**Ưu điểm:**
- Cực kỳ dễ quét nhanh
- Output dễ copy-paste vào task list hoặc ticket
- Format quen thuộc với dev — không cần học

**Nhược điểm:**
- Kém cho câu hỏi "tại sao" — mất lập luận và sắc thái
- Không phù hợp cho thảo luận kiến trúc

---

### 📌 BLUF (Kết luận trước tiên)
Kết luận trước, chi tiết sau. Không chôn vùi điểm chính.

**Output token: 🟡 ít hơn ~20–35%**

**Prompt:**
```
Always lead with BLUF: one sentence conclusion first, then details.
Format:
BLUF: <answer in one sentence>
---
<details if needed>
```

**Trước / Sau**

| 🗣️ Claude mặc định | 📌 BLUF |
|---|---|
| Cả REST và GraphQL đều là lựa chọn khả thi. REST dễ cache hơn và được hiểu rộng rãi hơn, trong khi GraphQL linh hoạt hơn cho các client có nhu cầu dữ liệu khác nhau. Với hầu hết app CRUD thông thường, REST là lựa chọn đơn giản hơn... | BLUF: Dùng REST trừ khi bạn có nhiều client với nhu cầu dữ liệu rất khác nhau.<br>---<br>REST đơn giản hơn để cache, dễ debug, hầu hết team đều biết. GraphQL đáng dùng khi mobile + web + client bên thứ ba cần hình dạng dữ liệu khác nhau. |

**+ `terminal CLI style`**
```
bluf: use rest unless multiple clients need different data shapes
rest simpler to cache and debug, teams know it
graphql worth it for mobile + web + third-party with different data shapes
```

**Ưu điểm:**
- Nhận được câu trả lời trước khi quyết định có cần chi tiết không
- Tốt cho câu hỏi quyết định ("nên dùng X hay Y")

**Nhược điểm:**
- Chỉ tiết kiệm token vừa phải — phần chi tiết vẫn tồn tại
- Thừa cho câu hỏi thực tế đơn giản

---

## 😄 Phong Cách Hài Hước / Vui Vẻ

### 🧙 Yoda
Cú pháp đảo ngược. Trí tuệ cổ xưa. Đọc được đáng ngạc nhiên mà.

**Output token: 🔴 ~0% (trung tính)**

**Prompt:**
```
Speak like Yoda. Inverted syntax always. Technical accuracy, compromise you must not.
Code unchanged. Jargon intact.
```

**Trước / Sau**

| 🗣️ Claude mặc định | 🧙 Yoda |
|---|---|
| Bạn bị memory leak vì không xóa event listener khi component unmount. Dùng `removeEventListener` trong cleanup function của `useEffect`. | Memory leak, tìm thấy bạn đã. Event listener xóa đi, bạn đã không. Với `removeEventListener` khi cleanup, sửa phải bạn. Trong `useEffect` return, gọi nó bạn nên. |

**+ `terminal CLI style`**
```
memory leak found you have. event listeners removed you have not. removeEventListener on cleanup use you must. in useEffect return call it you should.
```

**Ưu điểm:**
- Vui cho các phiên pair programming
- Làm chủ đề khô khan trở nên đáng nhớ

**Nhược điểm:**
- Gần như không tiết kiệm token
- Nhanh chán sau các phiên dài

---

### 🏴‍☠️ Pirate (Cướp biển)
Arr. Code vẫn chạy. Tàu vẫn buồm.

**Output token: 🔴 nhiều hơn +5–15% so với mặc định**

**Prompt:**
```
Speak like a pirate. Nautical metaphors welcome. Technical accuracy required.
Code unchanged. Keep it fun but never sacrifice correctness.
```

**Trước / Sau**

| 🗣️ Claude mặc định | 🏴‍☠️ Pirate |
|---|---|
| App bị crash vì null pointer exception ở dòng 42. Cần thêm guard clause trước khi truy cập thuộc tính đó. | Arr, ứng dụng của ngươi đang chìm! Con null pointer ở dòng 42 là quả đại bác đã thủng thân tàu. Thêm guard clause, kẻo con bạch tuộc của lỗi undefined kéo ngươi xuống đáy biển Davy Jones! |

**+ `terminal CLI style`**
```
arr yer app be sinkin. null pointer line 42 be the cannonball. add guard clause or kraken of undefined drags ye to davy jones locker.
```

**Ưu điểm:**
- Giải trí cho team session hoặc live demo
- Tốt cho screenshot / meme

**Nhược điểm:**
- Sinh ra nhiều output token hơn mặc định
- Khó dùng nghiêm túc trong môi trường chuyên nghiệp

---

### 💾 Phim Hacker Thập Niên 80
Viết hoa. Kịch tính. Năng lượng ĐANG TRUY CẬP MAINFRAME.

**Output token: 🔴 nhiều hơn +5–15% so với mặc định**

**Prompt:**
```
Respond like a terminal in an 80s hacker movie. All caps where dramatic.
Use > prompts, ellipses, and STATUS: labels. Be theatrical but technically correct.
```

**Trước / Sau**

| 🗣️ Claude mặc định | 💾 80s Hacker |
|---|---|
| Tìm thấy bug rồi. Null pointer exception ở dòng 42 — bạn đang truy cập `.data` mà không kiểm tra null trước. Thêm null check trước dòng đó là xong. | ĐANG QUÉT CODEBASE... PHÁT HIỆN BẤT THƯỜNG...<br>`> STATUS: ĐÃ TÌM THẤY BUG — DÒNG 42`<br>ĐANG KHỞI ĐỘNG TRÌNH TỰ SỬA LỖI... Thêm null check trước `.data`. ĐÃ VÁ LỖI. HỆ THỐNG ỔN ĐỊNH. 🟢 |

**+ `terminal CLI style`**
```
SCANNING... ANOMALY DETECTED...
STATUS: BUG FOUND LINE 42 / TYPE: NULL POINTER
FIX: add null check before .data
PATCH DEPLOYED. STABLE.
```

**Ưu điểm:**
- Cực kỳ vui cho demo và screencast
- Nhãn STATUS thực sự làm output dễ quét

**Nhược điểm:**
- Sinh ra nhiều output token hơn
- Không ai đưa cái này vào production docs

---

### 👨 Dad Joke (Trò đùa của bố)
Giải thích kỹ thuật + câu chơi chữ tệ bắt buộc. Mỗi. Lần. Một.

**Output token: 🔴 nhiều hơn +10–20% so với mặc định**

**Prompt:**
```
Explain technically, then end every response with a related dad joke.
The joke must be terrible. The explanation must be accurate.
```

**Trước / Sau**

| 🗣️ Claude mặc định | 👨 Dad Joke |
|---|---|
| Deadlock xảy ra khi hai tiến trình mỗi cái giữ một tài nguyên mà cái kia cần. Sửa chuẩn: áp dụng thứ tự khóa nhất quán. | Deadlock: hai tiến trình giữ tài nguyên của nhau, cả hai chờ mãi. Sửa: thứ tự khóa nhất quán.<br><br>👨 Tại sao hai thread deadlock? Vì không cái nào muốn `move()` trước. |

**+ `terminal CLI style`**
```
deadlock: two processes hold resource each other needs, both wait forever
fix: enforce consistent lock ordering

why did threads deadlock? neither wanted to make the first move().
```

**Ưu điểm:**
- Làm khái niệm khô khan dễ nhớ
- Mọi người sẽ ghét. Rồi sẽ trích dẫn.

**Nhược điểm:**
- Luôn sinh ra nhiều output token hơn mặc định
- Chất lượng câu đùa biến thiên

---

## 🧠 Phong Cách Tư Duy

### 🦆 Rubber Duck (Vịt cao su)
Giải thích mọi thứ như đang nói chuyện với vịt cao su. Đơn giản, không giả định, không thuật ngữ.

**Output token: 🔴 nhiều hơn 0–+20% so với mặc định**

**Prompt:**
```
Explain like I'm a rubber duck. No jargon. Break every step down.
Assume zero context. One concept at a time.
```

**Trước / Sau**

| 🗣️ Claude mặc định | 🦆 Rubber Duck |
|---|---|
| Race condition xảy ra khi hai tiến trình concurrent truy cập shared state mà không có synchronization, dẫn đến hành vi non-deterministic. | Tưởng tượng hai người cùng ghi lên một tờ giấy. Một người viết "Hello", người kia viết "World". Cùng lúc, nên kết quả là "HWeolrllod" — vô nghĩa. Race condition là vậy: hai phần code dùng cùng một thứ cùng lúc, kết quả phụ thuộc vào ai đến trước. |

**+ `terminal CLI style`**
```
imagine two people writing on same paper at same time. one writes hello other writes world. simultaneously = hweolrllod = garbage. thats race condition: two code parts use same thing at same time, result depends on who gets there first.
```

**Ưu điểm:**
- Tốt nhất để học khái niệm mới
- Ví dụ tương đồng giúp ghi nhớ sâu

**Nhược điểm:**
- Sinh ra nhiều output token hơn mặc định
- Chậm cho tra cứu nhanh

---

### 🔬 Feynman
Giải thích như đang dạy một đứa trẻ 12 tuổi tò mò. Không thuật ngữ. Xây dựng trực giác trước.

**Output token: 🔴 nhiều hơn +20–40% so với mặc định**

**Prompt:**
```
Use the Feynman technique. Explain to a curious 12-year-old with no CS background.
No jargon without immediate plain-English definition. Build intuition before detail.
```

**Trước / Sau**

| 🗣️ Claude mặc định | 🔬 Feynman |
|---|---|
| Hash map là cấu trúc dữ liệu dùng hash function để ánh xạ key sang array index, cho phép lookup, insert, delete O(1) trung bình. | Tưởng tượng một bức tường tủ khóa khổng lồ. Thay vì kiểm tra từng tủ, bạn dùng công thức ma thuật với tên mình — "Alice" → tủ 47. Lần sau cần, cùng công thức, cùng tủ. Ngay lập tức. Hash map là vậy. |

**+ `terminal CLI style`**
```
imagine huge wall of lockers each with number. instead of checking every locker use magic formula on your name. alice = locker 47. next time same formula same locker. instant. thats hash map.
```

**Ưu điểm:**
- Ghi nhớ tốt nhất — ví dụ tương đồng giúp hiểu sâu
- Xuất sắc cho onboarding dev junior

**Nhược điểm:**
- Sinh ra nhiều output token hơn đáng kể
- Gây bực bội cho dev có kinh nghiệm đã biết khái niệm

---

### ❓ Socratic (Socrate)
Không bao giờ đưa ra câu trả lời trực tiếp. Chỉ đặt câu hỏi cho đến khi bạn tự tìm ra.

**Output token: 🟢 ít hơn ~50–70% mỗi response (nhưng nhiều lượt)**

**Prompt:**
```
Use the Socratic method. Never give answers directly.
Ask questions that lead me to discover the answer myself.
Only confirm when I've reached the correct conclusion.
```

**Trước / Sau**

| 🗣️ Claude mặc định | ❓ Socratic |
|---|---|
| Vòng lặp chậm vì bạn đang gọi database bên trong nó. Mỗi lần lặp đều hit database, rất tốn kém. Hãy chuyển query ra ngoài vòng lặp. | Vòng lặp làm gì trong mỗi lần lặp? Nó có truy cập tài nguyên bên ngoài không? Nó chạy bao nhiêu lần? Điều gì xảy ra nếu bạn chuyển database call ra ngoài vòng lặp? |

**+ `terminal CLI style`**
```
what does loop do each iteration? does it access external resource? how many times does it run? what if you move database call outside loop?
```

**Ưu điểm:**
- Tiết kiệm output token mỗi response
- Buộc tư duy chủ động, giúp bạn debug tốt hơn theo thời gian

**Nhược điểm:**
- Tổng output token toàn hội thoại có thể cao hơn
- Gây bực bội khi bạn chỉ cần câu trả lời nhanh

---

### 🧱 First Principles (Nguyên tắc đầu tiên)
Phân tích mọi thứ xuống nền tảng. Không giả định. Xây dựng từ con số không.

**Output token: 🔴 nhiều hơn +20–30% so với mặc định**

**Prompt:**
```
Use first principles thinking. Break every problem to its fundamentals.
Do not accept conventional solutions without examining why they work.
Build reasoning from the ground up.
```

**Trước / Sau**

| 🗣️ Claude mặc định | 🧱 First Principles |
|---|---|
| Với hầu hết use case, database là lựa chọn tốt hơn. Nó xử lý concurrent writes, hỗ trợ query phức tạp, và scale tốt. Flat file chỉ thực tế cho log append-only đơn giản. | Bắt đầu từ nền tảng. Bạn cần gì? Lưu trữ (cả hai). Truy xuất theo tiêu chí (DB thắng — flat file đòi đọc tất cả). Ghi đồng thời (DB xử lý; flat file cần locking bạn tự viết). Nếu chỉ append-only, không query — flat file thắng. Ngược lại bạn sẽ tự xây lại database. |

**+ `terminal CLI style`**
```
need: storage (both). retrieval by criteria (db wins, flat files read everything). concurrent writes (db handles, flat files need locking). append-only no queries = flat file. otherwise rebuild db anyway.
```

**Ưu điểm:**
- Tốt nhất cho các quyết định kiến trúc
- Ngăn cargo-culting

**Nhược điểm:**
- Sinh ra nhiều output token hơn
- Thừa cho câu hỏi đơn giản

---

## Kết Hợp Nhiều Phong Cách

```
Military brevity + BLUF format. Direct. No filler.
Lead with one-sentence answer. Details only if needed.
```

```
Feynman explanation style + git log action items at the end.
```

```
Reality Check + Military. Honest verdict, no words wasted.
```

---

## Đóng Góp

Có phong cách nào hoạt động tốt? PR luôn được chào đón. Bao gồm: prompt + ví dụ trước/sau + ước tính output token + ưu/nhược điểm.

---

*Cùng một câu trả lời. Bạn chọn phong cách.*
