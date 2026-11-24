# Adversarial review — 特定国等証明書発給省令 art.2(4)（十五日以内）

Auditor posture: independent, read-only. No author comment was trusted. Only the
module triple, its durable pin and the three umbrella imports were examined; no
other module, pin or review was touched. All commands below were actually run in
the worktree `D:\CodexData\Temp\opencode\jtl-unit17`.

### CertificationIssuanceDeadlineFifteenDays.lean — 特定国等証明書発給省令 art.2(4)（十五日以内）

独立再抽出 performed directly against the pinned raw JSON (recursive walk of every
string leaf, not the project headers); 照合 / 判定 recorded below. Record form: H/T/D/C/U.

- **H（refutable hypothesis）** — The claimed needle is verbatim-unique in the whole
  law, lives in Art. 2 Para. 4 MAIN, SHA/title/revision are correct, kanji 十五=15,
  the spec is independent and the universal theorem axiom-free. **Result: Held for
  every source/Lean axis; refuted on one CI-hygiene axis (see D).**
- **T（reproduction / 再現）** — Raw snapshot `508M60000400060_20261031_508M60000400078.law.json`
  = 12,399 bytes on disk, 12,399 after CRLF→LF (no CRLF present); recomputed
  SHA-256 (LF-normalised) `b6e8cafa58a7ad7abefdaae2ae12dfb072104c3e69a18956fcf8759e35e9a901`
  = impl header. Whole-document needle count = **1**; exact-equal leaf length 50
  chars at path `law_full_text/Law/children#1/LawBody/children#2/MainProvision/
  children#1/Article[Num=2]/children#5/Paragraph[Num=4]/.../ParagraphSentence/
  Sentence[Num=1]/leaf`. `revision_info.law_title` matches INVENTORY
  `official_title` and the impl header (100 chars); `current_revision_status` =
  `CurrentEnforced` matches INVENTORY; revision id matches impl header;
  `law_type` = `MinisterialOrdinance`. Canonical `task_queue.build_tasks` contains
  the claimed NORM id with law 508M60000400060, article 2, paragraph 4,
  provision MAIN, source_path exactly as header. `int_to_kanji(15)` == `十五`;
  `spec_literals` == `{15}`; `十五`/`十五日以内` in 原文, `未満` absent.
  `checks_by_module()` loads the durable pin (article `2`, law id, needle).
  `boundary_evidence_categories` == `{zero, saturation, threshold_below,
  threshold_at, threshold_above}`. Lean: 10 `example`s in Tests (+2 in Spec);
  spec defs share no impl name (`independent_spec_ok` = True);
  `#print axioms` on all four named theorems → "does not depend on any axioms";
  no `sorry`/`admit`/`axiom`/`Classical.choice` outside comments.
- **D（decision / 判定）** — Source correspondence, location, hash, kanji, pin,
  independence, boundary coverage and axiom-freedom: **PASS**. One concrete
  defect outside legal content: **umbrella imports are not canonical**.
  `python scripts/ci/generate_umbrella.py --check` → `FAIL expected=1879
  actual=1879 duplicates=0` (exit 1). The three new imports were appended at
  lines 1877–1879; canonical position is after `Certificate200kTests` (line 114)
  and before `ClampedSubtraction` (line 115). Fix: run
  `python scripts/ci/generate_umbrella.py` (or move those three lines).
  No `以内`→`未満` or off-by-one error: 15 included, 16 excluded.
- **C（competing interpretation）** — A strict-`<` reading of 以内 would reject
  exactly fifteen days; `fifteen_inclusive` and the spec formula `¬ 15 < days`
  reject that reading. The converse competing reading (count acceptance day as
  day 1) is not modelled and cannot be settled by these files — flagged in U.
- **U（uncertainty）** — No legal correctness is claimed. Day-count convention,
  accepting authority, application requirements, other paragraphs and
  enforcement rules are explicitly unmodelled; human legal review remains
  pending (`LEGAL_REVIEW_PENDING`).

## Machine-check record

`review_ok("CertificationIssuanceDeadlineFifteenDays", <this file text>)` returns
`True` (module-specific section contains 独立再抽出, 判定/照合 and labelled
H（/T（/D（/C（/U（ records).

## Verdict

One concrete, machine-detectable defect: the umbrella import list is non-canonical
and fails `generate_umbrella.py --check`; the concrete fix is to regenerate the
umbrella. Apart from that CI-hygiene issue, no legal-correctness or transcription
defect was found in the modelled fifteen-day inclusive deadline. No claim of
legal correctness is made; human legal review is pending.
