---
name: shortvideo-from-md
description: "Turn Markdown files and long-form notes into short-video production packages. Use when Codex needs to read `.md` or Markdown content such as articles, outlines, course notes, README files, blog drafts, or knowledge docs and convert them into short-form video outputs: hook, script, narration, shot list, captions, storyboard, or platform-specific variants. Trigger when the user asks to generate a short-video script from Markdown, convert an article into spoken delivery, produce narration or subtitles or storyboards, specify a style and duration for a short video, or create ready-to-produce content for Douyin, Xiaohongshu, Reels, or similar short-video platforms."
---

# Shortvideo From Md

## Overview

Read the Markdown source first, compress it into one clear video idea, and then adapt it into a short-video package that is ready for scripting, recording, or editing.

Default to colloquial Mandarin short-video conventions unless the user asks for another language, market, or platform.

## Quick Start

1. Read the full Markdown file or content before drafting the script.
2. Determine the requested deliverable:
   - `script-only`
   - `script-and-narration`
   - `storyboard-package`
   - `full-production-package`
3. If the user omits details, infer these defaults:
   - platform: `Douyin / Weixin Channels generic`
   - style: `knowledge breakdown + conversational Mandarin`
   - duration: `45-60s`
   - audience: infer from the source text
4. If the source is too dense for one video, propose a `single strongest cut` and up to `3 series episodes`.
5. If the user asks to `generate the video directly`, produce the full package first, then pass it to TTS or video tools only when they are available. Otherwise state clearly that the package is ready for downstream generation.

## Workflow

### 1. Ingest the Source

Extract:
- the core thesis
- the strongest payoff for the viewer
- facts, numbers, examples, and quotes worth preserving
- the intended audience
- any action the viewer should take at the end

Do not base the video on the title alone. Use the body content.

If the Markdown is mostly headings or notes, reconstruct the logic before writing. If the Markdown is already polished prose, compress it into spoken language rather than copying its sentence structure.

### 2. Choose the Best Video Angle

Pick one primary angle:
- `counterintuitive`: challenge a common belief
- `problem-solving`: start with pain point, end with tactic
- `knowledge-breakdown`: explain one concept simply
- `case-story`: use a person, company, or event as the spine
- `checklist-advice`: give actionable steps fast

If multiple angles are possible, prefer the one with the strongest hook in the first 2 seconds.

### 3. Match Duration to Structure

Use this pacing by default:

| Duration | Suggested structure |
| --- | --- |
| `15-20s` | hook -> one insight -> CTA |
| `30-45s` | hook -> problem -> 2-3 beats -> CTA |
| `45-60s` | hook -> conflict -> 3-5 beats -> takeaway |
| `60-90s` | hook -> setup -> mini chapters -> payoff -> CTA |

Keep a visual or semantic change every 2-4 seconds.

### 4. Apply the Requested Style

If the user names a style, creator vibe, or platform, follow it.

If the user does not specify a style, use `knowledge breakdown + conversational Mandarin`.

Use [references/style-presets.md](references/style-presets.md) when you need style-specific pacing, hook patterns, or shot direction.

### 5. Produce the Right Output Package

When the user does not constrain the output, return this package in order:

1. `video-positioning`
2. `title-and-cover-copy`
3. `spoken-script`
4. `shot-by-shot-storyboard`
5. `subtitle-copy`
6. `b-roll-suggestions`
7. `bgm-and-sfx`
8. `ending-cta`

Use [references/output-templates.md](references/output-templates.md) for the response structure.
Use [references/examples.md](references/examples.md) when you need a concrete request pattern or a more playful adaptation example.

## Output Rules

- Write for spoken delivery, not article reading.
- Default the actual output language to Mandarin unless the user requests otherwise.
- Keep sentences short enough to be said in one breath.
- Make the first line usable as an opening hook.
- Preserve factual claims from the source. Do not invent statistics.
- If the source is weak or incomplete, mark assumptions explicitly.
- Keep on-screen subtitle lines short. Prefer one idea per line.
- When the user asks for a strong personality style, imitate rhythm and structure, not copyrighted phrasing or signature catchphrases.
- If the source contains technical or high-stakes claims, keep the original nuance and avoid oversimplifying it into a misleading promise.

## Direct Video Generation

This skill is best at preparing a production-ready package.

If TTS or video-generation tools are available, adapt the outputs for them:
- for TTS: return a clean narration version without stage directions
- for avatar or presenter tools: split by beat and emotion
- for text-to-video tools: turn each shot into a concise visual prompt

If no downstream video tool is available, stop at the package stage and say that it is ready for recording or generation.

## Resources

### references/

Load these only when needed:
- [references/style-presets.md](references/style-presets.md): style presets for short-video tone, pace, and hook design
- [references/output-templates.md](references/output-templates.md): response templates for script, narration, storyboard, and production package
- [references/examples.md](references/examples.md): example user requests and a fun demonstration case
