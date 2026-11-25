# Adversarial review — TariffLawSupplArt1Heisei13Enforcement (mechanical, NOT human)

Independent of the FORMALIZE / PROVE workstream. Claims re-derived from
committed pinned bytes; not a human legal review.

### TariffLawSupplArt1Heisei13Enforcement.lean — 関税定率法 附則 art.1

判定: 照合 (BY-DESIGN / CONFIRMED)

- 独立再抽出 (一次資料): law id 143AC0000000054, revision
  `143AC0000000054_20260601_508AC0000000005`,
  `data/raw/143AC0000000054_20260601_508AC0000000005.law.json`.
  SHA-256 recomputed: `924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c`.
- Pinned needle located in scoped Supplementary Provision Article 1
  (`LawBody[66]/SupplProvision/SupplProvision[1]/Article:1/Article#1/Paragraph#1/ParagraphSentence/Sentence#1`):
  「この法律（第二条及び第三条を除く。）は、平成十三年一月六日から施行する。」
- Statutory literals in THIS clause: 二=2, 三=3 (excluded articles), 十三=13,
  六=6 (era year/day); `spec_literals={2,3,6,13}`, clause correspondence True.
  The era-to-Gregorian conversion is NOT performed — the model keeps the
  statute's own era-number triple `(13,1,6)`.
- Computation: impl excludes articles 2 and 3; independent spec uses its own
  `specExcluded` predicate and `specInForce` negation, no implementation
  identifiers. Article 1/4 are in force; 2/3 are not.
- Boundary categories (kernel-decided): small_input (1,2,3,4), threshold_below
  (1 vs 2, 2 vs 3, 12 vs 13, 5 vs 6), threshold_at (2,3,13,6),
  threshold_above (4 vs 3, 14 vs 13, 7 vs 6). Finite grid check, not universal.
- 監査 (H/T/D/C/U): H（この法律は2条3条を除き平成13年1月6日から施行）,
  T（二=2、三=3、十三=13、六=6、境界1/2/3/4・12/13/14・5/6/7、SHA-256固定）,
  D（by decide のみ、sorry/admit/独自公理なし）,
  C（needle verbatim in scoped 附則art.1、数値当該条項に存在、spec independence）,
  U（他条の施行日・経過措置・元号から西暦への換算・改正内容は NOT MODELLED、
    人間レビュー未了）.
- H/T/D/C/U 判定: BY-DESIGN / CONFIRMED — bounded computable slice only.

This mechanical review does NOT satisfy the human legal-review axis, which
remains `LEGAL_REVIEW_PENDING`.
