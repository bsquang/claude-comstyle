# Contributing

Thanks for wanting to add a style!

## How to add a new style

1. Fork the repo and create a branch: `git checkout -b style/your-style-name`
2. Add your style to **both** `README.md` and `README_VN.md` under the appropriate section
3. Follow this format:

```
### <emoji> <Style Name>
<One-line description>

**Token savings: <badge> ~<range>%**

**Prompt:**
\```
<the actual prompt>
\```

**Example:**
> **You:** <sample question>

> **AI:** <sample response>

**Pros:**
- ...

**Cons:**
- ...
```

4. Update the Output Token summary table at the top of both `README.md` and `README_VN.md`
5. Open a PR with title: `Add: <Style Name> style`

> **Note:** Any change to `README.md` must be reflected in `README_VN.md` and vice versa.

## Guidelines

- The prompt must be copy-paste ready — no placeholders
- Include a realistic example (not cherry-picked)
- Token savings estimate should be honest — test it
- Pros and cons must be balanced — at least 2 each
- Keep it technically accurate; fun is secondary to correctness

## What makes a good style

- Solves a real use case (not just "sounds cool")
- Noticeably different behavior from existing styles
- Works consistently across multiple prompts, not just one

## What will be rejected

- Duplicate of an existing style
- No example provided
- Pros/cons section missing
- Prompt that breaks technical accuracy for the sake of the style
