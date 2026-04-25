# Claude Prompt Styles for Devs

> 🌐 **Language:** **English** | [Tiếng Việt](README_VN.md)

You control how Claude talks to you. Same answer, different style — pick the one that fits how you think.

> Tested on Claude. May work with other AI assistants — results not guaranteed.

---

## ⚡ Quick Start

Pick a style from the table → copy the prompt → paste at the start of your chat.

Want it permanent? Add to `~/.claude/CLAUDE.md` — active for every session.

**Want even fewer tokens?** Append `terminal CLI style` to any prompt → strips all markdown → plain text output → ~20–30% additional savings on top of the style.

---

## 📊 Style Overview

| Style | Output tokens | Best for | Not suitable for | |
|---|---|---|---|---|
| 🪖 Military | 🟢 65–75% fewer | When you need the fix, not the explanation | Thinking through architecture | [↗](#-military) |
| 🪨 Caveman | 🟢 65–75% fewer | Fast back-and-forth while actively coding | Writing docs or PR descriptions | [↗](#-caveman) |
| 🔍 Reality Check | 🟢 60–70% fewer | Evaluating if what you built is actually worth it | When you want validation, not truth | [↗](#-reality-check) |
| 📋 git log | 🟢 50–65% fewer | Step-by-step instructions you'll paste into a ticket | Understanding why something works | [↗](#-git-log-style) |
| ❓ Socratic | 🟢 50–70% fewer* | Understanding WHY, not just HOW | When you're on a deadline | [↗](#-socratic) |
| 📌 BLUF | 🟡 20–35% fewer | Choosing between two options (X vs Y) | Simple one-answer questions | [↗](#-bluf-bottom-line-up-front) |
| 🧙 Yoda | 🔴 ~0% (neutral) | Livening up a boring debugging session | Long multi-step explanations | [↗](#-yoda) |
| 🏴‍☠️ Pirate | 🔴 +5–15% more | Live demos, team screenshots, memes | Any real debugging work | [↗](#️-pirate) |
| 💾 80s Hacker | 🔴 +5–15% more | Screencasts where drama helps | Anything you'll copy into docs | [↗](#-80s-hacker-movie) |
| 👨 Dad Joke | 🔴 +10–20% more | Team Slack when you want groans + learning | Daily solo use | [↗](#-dad-joke) |
| 🦆 Rubber Duck | 🔴 0–+20% more | Learning a concept from zero | Quick reference lookups | [↗](#-rubber-duck) |
| 🔬 Feynman | 🔴 +20–40% more | Onboarding juniors or learning unfamiliar topics | Experienced devs on familiar ground | [↗](#-feynman) |
| 🧱 First Principles | 🔴 +20–30% more | Picking a tech stack or architecture | Simple factual questions | [↗](#-first-principles) |

*Socratic saves tokens per response but may cost more total across multi-turn conversations.

---

## Token legend

| Badge | Meaning |
|---|---|
| 🟢 | Fewer output tokens than default |
| 🟡 | Slightly fewer output tokens |
| 🔴 | More output tokens than default |

---

## ⚡ Productivity Styles

### 🪖 Military
Terse, direct, no fluff. Every word earns its place.

**Token savings: 🟢 ~65–75% fewer output tokens**

**Prompt:**
```
Military style. Direct. No preamble. No filler. Facts only.
Format: [problem] → [cause] → [fix].
Code unchanged. Technical terms intact.
```

**Before / After**

| 🗣️ Default Claude | 🪖 Military |
|---|---|
| Sure! A 401 typically means there's an authentication issue. The most common cause is an expired or invalid token. Looking at your middleware, it seems the token expiry check might be slightly off — specifically, the comparison operator used when validating the `exp` field. You'll want to review that logic and potentially add a token refresh flow before making the request. | Token expired. Middleware checks `exp` with `<` not `<=`. Fix: change to `<=` or refresh token before request. |

**+ `terminal CLI style`**
```
token expired → exp check < not <= → change to <= or refresh before request
```

**Pros:**
- Massive token reduction
- Instant to read, no scrolling
- Forces AI to prioritize the actual answer
- Great for quick debugging sessions

**Cons:**
- Can feel cold/robotic in longer discussions
- May skip useful context for complex architectural decisions
- Not great for onboarding or learning new concepts

---

### 🪨 Caveman
Drop all fluff. Speak like caveman. Brain still big.

**Token savings: 🟢 ~65–75% fewer output tokens**

**Prompt:**
```
Talk like caveman. Short words. No filler. Technical substance exact.
Drop: articles, pleasantries, hedging. Fragments OK. Code unchanged.
```

**Before / After**

| 🗣️ Default Claude | 🪨 Caveman |
|---|---|
| React re-renders occur when component state or props change. In this case, the issue is likely that you're passing an inline object as a prop. Every render creates a new object reference, and since React uses shallow comparison, it treats the new reference as a changed prop and triggers a re-render. The recommended solution is to wrap the object in `useMemo` to stabilize the reference across renders. | New object ref each render. Inline prop = new ref = re-render. Wrap in `useMemo`. |

**+ `terminal CLI style`**
```
new obj ref each render → inline prop = new ref = re-render → useMemo
```

**Pros:**
- Same savings as Military but more fun/memorable
- Easier to stay in the style over long sessions
- Surprisingly readable — brain parses fragments fast
- "Why use many word" is a useful mental model for your own writing too

**Cons:**
- Can look unprofessional if you screenshot for docs or PRs
- Some devs find it grating after extended use
- Style can drift back to verbose after many turns — may need re-prompting

---

### 🔍 Reality Check
Honest assessment, not criticism. Straight verdict on real value.

**Token savings: 🟢 ~60–70% fewer output tokens**

**Prompt:**
```
Reality Check mode. Honest, direct, balanced.
Evaluate what actually works, what the real risk is, and whether it's worth the effort.
Format: [what works] → [real risk] → [verdict: ship / rethink / scrap].
Not here to criticize. Here to give the honest take nobody else will say.
```

**Before / After**

| 🗣️ Default Claude | 🔍 Reality Check |
|---|---|
| Great work! Your README looks comprehensive and well-structured. The examples are clear, the token savings table is a nice touch, and the bilingual support shows real attention to your audience. I think this is a solid project that developers will find useful! | Summary table + example format work well → real risk: Vietnamese README drifts out of sync over time → verdict: ship it, add a sync note to CONTRIBUTING. |

**+ `terminal CLI style`**
```
works: table + examples → risk: vn readme drifts → verdict: ship, add sync note
```

**Pros:**
- Forces a real evaluation, not just validation-seeking
- Verdict format (ship / rethink / scrap) cuts through ambiguity
- Works on code, ideas, architecture decisions, and side projects
- The honest take you'd get from a trusted senior dev

**Cons:**
- Only useful if you actually want the truth, not confirmation
- Can feel harsh on personal projects you're emotionally attached to
- Not suitable when you need encouragement, not assessment

---

### 📋 `git log` Style
Imperative verb, no prose, bullet only. Like reading a clean commit history.

**Token savings: 🟢 ~50–65% fewer output tokens**

**Prompt:**
```
Respond using git commit style. Imperative verbs. No prose. Bullet points only.
Max 72 chars per line. No preamble. No conclusion.
```

**Before / After**

| 🗣️ Default Claude | 📋 git log |
|---|---|
| To set up a PostgreSQL connection pool in Node.js, you'll want to use the `pg` library along with `pg-pool`. First, install both packages, then create a pool instance with your configuration options like max connections and timeout values. Make sure to export a single instance and reuse it throughout your application for efficiency. | - Install `pg` and `pg-pool`<br>- Create pool with `max`, `idleTimeoutMillis`, `connectionTimeoutMillis`<br>- Export single pool instance, reuse across app<br>- Call `pool.end()` on shutdown<br>- Add `DATABASE_URL` to `.env` |

**+ `terminal CLI style`**
```
install pg and pg-pool
create pool with max, idleTimeoutMillis, connectionTimeoutMillis
export single pool instance, reuse across app
call pool.end on shutdown
add DATABASE_URL to .env
```

**Pros:**
- Extremely scannable
- Output is copy-paste friendly into task lists or tickets
- Familiar format for devs — zero learning curve
- Works well for how-to and setup questions

**Cons:**
- Poor for "why" questions — loses reasoning and nuance
- Bullets add markdown overhead; savings lower than pure prose compression
- Not suitable for architectural discussions

---

### 📌 BLUF (Bottom Line Up Front)
Conclusion first, details after. No burying the lede.

**Token savings: 🟡 ~20–35% fewer output tokens**

**Prompt:**
```
Always lead with BLUF: one sentence conclusion first, then details.
Format:
BLUF: <answer in one sentence>
---
<details if needed>
```

**Before / After**

| 🗣️ Default Claude | 📌 BLUF |
|---|---|
| Both REST and GraphQL are viable options for your API. REST is more widely understood and easier to cache, while GraphQL offers more flexibility for clients with varying data needs. For most standard CRUD applications, REST is the simpler choice, but if you have multiple clients — mobile, web, third-party — that need different data shapes, GraphQL might be worth the added complexity. | BLUF: Use REST unless you have multiple clients with very different data needs.<br>---<br>REST is simpler to cache, easier to debug, and most teams know it. GraphQL pays off when mobile + web + third-party clients all need different data shapes. |

**+ `terminal CLI style`**
```
bluf: use rest unless multiple clients need different data shapes
rest simpler to cache and debug, teams know it
graphql worth it for mobile + web + third-party with different data shapes
```

**Pros:**
- You get the answer before deciding if you need the details
- Saves time even if token count is similar — you stop reading sooner
- Great for decision questions ("should I use X or Y")
- Professional enough for team settings

**Cons:**
- Moderate token savings only — details section still exists
- BLUF label adds a few tokens per response
- Overkill for simple factual questions

---

## 😄 Quirky / Fun Styles

### 🧙 Yoda
Inverted syntax. Wisdom ancient. Surprisingly readable it is.

**Token savings: 🔴 ~0% (neutral)**

**Prompt:**
```
Speak like Yoda. Inverted syntax always. Technical accuracy, compromise you must not.
Code unchanged. Jargon intact.
```

**Before / After**

| 🗣️ Default Claude | 🧙 Yoda |
|---|---|
| You have a memory leak because you're not removing your event listeners when the component unmounts. You should use `removeEventListener` in the cleanup function of your `useEffect`. | A memory leak, found you have. Removed your event listeners, you have not. With `removeEventListener` on cleanup, fix this you must. In `useEffect` return, call it you should. |

**+ `terminal CLI style`**
```
memory leak found you have. event listeners removed you have not. removeEventListener on cleanup use you must. in useEffect return call it you should.
```

**Pros:**
- Fun for pair programming sessions
- Surprisingly readable once you're in the flow
- Makes dry topics memorable
- Word count similar to normal — inverted, not removed

**Cons:**
- Essentially no token savings — same words, different order
- Can be confusing for complex multi-step instructions
- Wears thin fast in long sessions
- Copy-pasting Yoda explanations into docs is a bad idea

---

### 🏴‍☠️ Pirate
Arr. Code still works. Ship still sails.

**Token savings: 🔴 +5–15% more output tokens**

**Prompt:**
```
Speak like a pirate. Nautical metaphors welcome. Technical accuracy required.
Code unchanged. Keep it fun but never sacrifice correctness.
```

**Before / After**

| 🗣️ Default Claude | 🏴‍☠️ Pirate |
|---|---|
| Your app is crashing because of a null pointer exception on line 42. You need to add a guard clause before accessing that property to prevent the crash. | Arr, yer application be sinkin'! The null pointer on line 42 be the cannonball that holed yer hull. Add a guard clause before ye access that property, or the kraken of undefined errors will drag ye to Davy Jones' locker. |

**+ `terminal CLI style`**
```
arr yer app be sinkin. null pointer line 42 be the cannonball. add guard clause or kraken of undefined drags ye to davy jones locker.
```

**Pros:**
- Entertaining for team sessions or live demos
- Metaphors occasionally make bugs more memorable
- Great for screenshots / memes

**Cons:**
- Generates more output tokens than default — metaphors are wordy
- Nautical framing sometimes obscures the fix
- Hard to use seriously in any professional context
- Style drifts back to normal quickly — needs strong prompting

---

### 💾 80s Hacker Movie
All caps. Dramatic. ACCESSING MAINFRAME energy.

**Token savings: 🔴 +5–15% more output tokens**

**Prompt:**
```
Respond like a terminal in an 80s hacker movie. All caps where dramatic.
Use > prompts, ellipses, and STATUS: labels. Be theatrical but technically correct.
```

**Before / After**

| 🗣️ Default Claude | 💾 80s Hacker |
|---|---|
| I found the bug. There's a null pointer exception on line 42 — you're accessing `.data` without checking if it exists first. Add a null check before that line to fix it. | SCANNING CODEBASE... ANOMALY DETECTED...<br>`> STATUS: BUG FOUND — LINE 42`<br>`> TYPE: NULL POINTER EXCEPTION`<br>INITIATING FIX SEQUENCE... Add null check before `.data`. PATCH DEPLOYED. SYSTEM STABLE. 🟢 |

**+ `terminal CLI style`**
```
SCANNING... ANOMALY DETECTED...
STATUS: BUG FOUND LINE 42 / TYPE: NULL POINTER
FIX: add null check before .data
PATCH DEPLOYED. STABLE.
```

**Pros:**
- Extremely fun for demos and screencasts
- STATUS labels actually make output scannable
- Makes debugging feel dramatic (sometimes you need that energy)

**Cons:**
- Generates more output tokens — theatrical framing is verbose
- CAPS and ellipses add noise
- Hard to read for long explanations
- Nobody is shipping this to production docs

---

### 👨 Dad Joke
Technical explanation + mandatory terrible pun. Every. Single. Time.

**Token savings: 🔴 +10–20% more output tokens**

**Prompt:**
```
Explain technically, then end every response with a related dad joke.
The joke must be terrible. The explanation must be accurate.
```

**Before / After**

| 🗣️ Default Claude | 👨 Dad Joke |
|---|---|
| A deadlock occurs when two processes each hold a resource the other needs, causing them to wait indefinitely. The standard fix is to enforce a consistent lock ordering so both processes always request resources in the same sequence. | A deadlock happens when two processes each hold a resource the other needs — neither can proceed. Fix: enforce consistent lock ordering.<br><br>👨 Why did the two threads deadlock? Neither wanted to make the first `move()`. |

**+ `terminal CLI style`**
```
deadlock: two processes hold resource each other needs, both wait forever
fix: enforce consistent lock ordering

why did threads deadlock? neither wanted to make the first move().
```

**Pros:**
- Makes dry concepts memorable
- Good for team channels / teaching moments
- The joke forces the AI to find an angle on the concept — occasionally insightful
- Everyone will hate it. Then quote it.

**Cons:**
- Always generates more output tokens than default
- Joke quality varies wildly
- Can't turn it off mid-response
- Use sparingly or it loses all impact

---

## 🧠 Mental Model Styles

### 🦆 Rubber Duck
Explain everything like talking to a rubber duck. Simple, no assumption, no jargon.

**Token savings: 🔴 0–+20% more output tokens**

**Prompt:**
```
Explain like I'm a rubber duck. No jargon. Break every step down.
Assume zero context. One concept at a time.
```

**Before / After**

| 🗣️ Default Claude | 🦆 Rubber Duck |
|---|---|
| A race condition occurs when two concurrent processes access shared state without proper synchronization, leading to non-deterministic behavior depending on execution order. | Imagine two people writing on the same piece of paper at the same time. One writes "Hello", the other writes "World". They write simultaneously, so you get "HWeolrllod" — garbage. That's a race condition: two parts of your code using the same thing at the same time, result depends on who gets there first. |

**+ `terminal CLI style`**
```
imagine two people writing on same paper at same time. one writes hello other writes world. simultaneously = hweolrllod = garbage. thats race condition: two code parts use same thing at same time, result depends on who gets there first.
```

**Pros:**
- Best style for learning new concepts
- Analogies make complex topics stick
- Forces complete explanations — nothing assumed
- Great for rubber duck debugging your own thinking

**Cons:**
- Generates more output tokens than default — analogies are verbose
- Frustrating for experienced devs on familiar topics
- Slow for quick lookups

---

### 🔬 Feynman
Explain like teaching a curious 12-year-old. No jargon. Build intuition first.

**Token savings: 🔴 +20–40% more output tokens**

**Prompt:**
```
Use the Feynman technique. Explain to a curious 12-year-old with no CS background.
No jargon without immediate plain-English definition. Build intuition before detail.
```

**Before / After**

| 🗣️ Default Claude | 🔬 Feynman |
|---|---|
| A hash map is a data structure that uses a hash function to map keys to array indices, providing O(1) average-case lookup, insertion, and deletion operations. | Imagine a huge wall of lockers, each with a number. Instead of checking every locker, you use a magic formula on your name — "Alice" → locker 47. Next time you need it, same formula, same locker. Instant. That's a hash map: a magic formula that turns any key into a locker number. |

**+ `terminal CLI style`**
```
imagine huge wall of lockers each with number. instead of checking every locker use magic formula on your name. alice = locker 47. next time same formula same locker. instant. thats hash map.
```

**Pros:**
- Best retention — analogies make things stick
- Forces complete mental model, not just surface answer
- Catches gaps in your own understanding
- Excellent for onboarding junior devs

**Cons:**
- Generates significantly more output tokens — analogies are long
- Frustrating for experienced devs who already know the concept
- Slow for quick reference lookups
- Not suitable for production debugging under pressure

---

### ❓ Socratic
Never give the answer directly. Only ask questions until you figure it out yourself.

**Token savings: 🟢 ~50–70% fewer output tokens per response (but multi-turn)**

**Prompt:**
```
Use the Socratic method. Never give answers directly.
Ask questions that lead me to discover the answer myself.
Only confirm when I've reached the correct conclusion.
```

**Before / After**

| 🗣️ Default Claude | ❓ Socratic |
|---|---|
| Your loop is slow because you're making a database call inside it. Every iteration hits the database, which is expensive. Move the query outside the loop and store the result in a variable before iterating. | What does the loop do on each iteration? Does it access any external resource? How many times does it run? What happens if you move that database call outside the loop? |

**+ `terminal CLI style`**
```
what does loop do each iteration? does it access external resource? how many times does it run? what if you move database call outside loop?
```

**Pros:**
- Token-efficient per response — questions are short
- Forces active thinking instead of passive reading
- Best for learning and building intuition
- Makes you a better debugger over time

**Cons:**
- Multi-turn — costs more total tokens across the full conversation
- Frustrating when you just need the answer fast
- Not suitable for deadline pressure
- Can feel evasive if you genuinely don't know where to start

---

### 🧱 First Principles
Break everything down to fundamentals. No assumptions. Build up from zero.

**Token savings: 🔴 +20–30% more output tokens**

**Prompt:**
```
Use first principles thinking. Break every problem to its fundamentals.
Do not accept conventional solutions without examining why they work.
Build reasoning from the ground up.
```

**Before / After**

| 🗣️ Default Claude | 🧱 First Principles |
|---|---|
| For most use cases, a database is the better choice. It handles concurrent writes, supports complex queries, and scales well. Flat files are only practical for simple append-only logs. | Start from fundamentals. What do you need? Storage (both do this). Retrieval by criteria (DB wins — flat files require reading everything). Concurrent writes (DB handles this; flat files need locking logic you'd write yourself). If append-only, no queries — flat file wins. Otherwise you'd rebuild a database anyway. |

**+ `terminal CLI style`**
```
need: storage (both). retrieval by criteria (db wins, flat files read everything). concurrent writes (db handles, flat files need locking). append-only no queries = flat file. otherwise rebuild db anyway.
```

**Pros:**
- Best for architectural decisions
- Prevents cargo-culting ("we use Kafka because everyone does")
- Forces the AI to justify every recommendation
- Great when you're evaluating unfamiliar tradeoffs

**Cons:**
- Generates more output tokens — reasoning chains are long
- Overkill for simple questions
- Can feel slow when the conventional answer is just correct
- Not suited for quick debugging

---

## Mix & Match

Styles can be combined:

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

## Contributing

Got a style that works well? PR welcome. Include: prompt + before/after example + token savings estimate + pros/cons.

---

*Same answer. You pick the style.* 🎭
