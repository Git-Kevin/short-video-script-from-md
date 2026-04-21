---
name: xhs-titles-from-md
description: "Generate Xiaohongshu / RedNote title variants from Markdown content. Use when Codex needs to read a `.md` file or pasted Markdown such as articles, notes, tutorials, product docs, reviews, outlines, or personal stories and turn it into multiple Xiaohongshu titles by type. Trigger when the user asks for Xiaohongshu titles, RedNote titles, XHS title hooks, title optimization, title matrices, title rewrites, or wants Markdown content adapted into emotional-resonance, pain-point-tutorial, numbered-list, curiosity-reversal, audience-targeted, review-comparison, result, pain-point, question, list, anti-pitfall, comparison, resonance, audience-targeted, or scene-based titles."
---

# Xhs Titles From Md

## Overview

Read the full Markdown source before drafting titles.

Distill one clear click reason from the body content, then express it through multiple Xiaohongshu title types that match the audience, scene, and tone.

Default to Mandarin Xiaohongshu conventions unless the user asks for another language, market, or brand voice.

Treat the following six Xiaohongshu-native headline types as the default mental model unless the user asks for another framework:
- `emotional-resonance`
- `pain-point-tutorial`
- `numbered-list`
- `curiosity-reversal`
- `audience-targeted`
- `review-comparison`

## Quick Start

1. Read the entire Markdown file or pasted Markdown before writing any title.
2. Extract:
   - target audience
   - strongest payoff
   - core scene or use case
   - proof points that make the claim believable
   - emotional angle and tone constraints
   - which of the six Xiaohongshu-native title types best fit the source
3. If the user gives no extra constraints, return:
   - `content-angle`: one-sentence summary
   - `top-3-recommended`: strongest three titles
   - `title-matrix`: 12 titles across the 6 default Xiaohongshu-native types
4. If the user asks for more coverage, expand to 18 to 24 titles.
5. If the Markdown covers several ideas, choose the single strongest angle instead of trying to title every subsection.

## Workflow

### 1. Ingest the Source

Use the body content, not only the original title or headings.

Compress the Markdown into:
- what the post is really about
- who should click
- what they gain after reading
- which concrete details support the promise

If the Markdown is mostly an outline, reconstruct the logic before writing titles.

### 2. Choose the Right Title Mix

Match the title mix to the source material:
- use `emotional-resonance` when the source contains strong feelings, identity, relief, obsession, regret, or a highly subjective point of view
- use `pain-point-tutorial` when the source solves a clear problem and can promise a direct method, checklist, or walkthrough
- use `numbered-list` when the source offers multiple tips, steps, products, lessons, or decisions that benefit from low reading friction
- use `curiosity-reversal` when the source includes a reveal, a contrast, an unexpected truth, or a strong information gap
- use `audience-targeted` when the source clearly belongs to a labeled crowd, body type, skin tone, profession, schedule, or life stage
- use `review-comparison` when the source contains testing, before/after evidence, product judgment, tradeoff analysis, or a purchase decision

Under the hood, these six default types can still borrow patterns from `result`, `pain-point`, `question`, `list`, `anti-pitfall`, `comparison`, `resonance`, and `scene-based` framing when that improves the hook.

Use [references/title-types.md](references/title-types.md) when you need formulas, selection guidance, or example patterns.

### 3. Draft the Titles

Center each title on one clear payoff.

Prefer concrete nouns, visible outcomes, and specific scenes over abstract language.

Use numerals when they sharpen the hook.

Use separators such as `|` only when they improve readability.

Avoid stacking several promises into one line.

Prefer the Xiaohongshu high-click formula when it fits the source:
`<target audience> + <pain point or scene> + <emotion word or number> + <solution or payoff>`

Examples:
- `busy office workers + no time for makeup + done in 5 minutes + faux no-makeup tutorial`
- `warm skin tones + lipstick looks muddy on bare skin + these shades are stunning + lipstick picks`

### 4. Rank the Options

Recommend the top 3 titles based on:
- audience clarity
- strength of payoff
- credibility from the Markdown
- fit for Xiaohongshu browsing behavior
- distinctiveness without false hype

### 5. Adapt to User Constraints

If the user specifies title types, quantity, tone, or a brand style, follow those constraints first.

If the user provides an existing title, diagnose why it is weak and then rewrite it using the requested title types.

Use [references/output-templates.md](references/output-templates.md) for the response shapes.

## Output Rules

- Write in Mandarin by default.
- Preserve facts and claims from the source. Do not invent achievements, prices, time spans, or statistics.
- Prefer compact titles that scan quickly, but prioritize natural reading over rigid character counts.
- Keep punctuation light. Do not use repeated exclamation marks.
- Avoid exaggerated promises that the Markdown cannot support.
- Use strong Xiaohongshu emotion words such as `who gets it`, `wish I knew sooner`, `so good`, or `finally fixed` only when they still fit the source truthfully.
- For `curiosity-reversal` and `review-comparison`, never fabricate tests, rankings, red-black lists, or hidden secrets that the Markdown does not actually support.
- When the source is corporate, medical, legal, financial, or otherwise high-stakes, prefer restrained, accurate wording over sensational hooks.
- When the user asks for more aggressive or viral-style options, increase curiosity and tension without crossing into false or unsafe claims.

## Resources

Load these only when needed:
- [references/title-types.md](references/title-types.md): title categories, formulas, fit guidance, and patterns
- [references/output-templates.md](references/output-templates.md): response shapes for default, expanded, and rewrite requests
