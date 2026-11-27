### SeparateTariffApplication.lean — 特定貨物の一般関税・報復関税の別個適用 第五条

- 独立再抽出（一次資料）: law id 417CO0000000289; revision
  417CO0000000289_20130901_425CO0000000238; source
  data/raw/417CO0000000289_20130901_425CO0000000238.law.json;
  blob 23,840 bytes, SHA-256 independently recomputed
  `3bc5cd636935332e9adb010e60eb07a97ffc273c2027d2e04c6e0318968d8a6d`
  — matches the impl pin.
- 照合（Article Num 5, caption （関税法の適用）, title 第五条, scoped 原文 62 chars）:
  needle found verbatim, 一字一句改変なし (whole-law count 1):
  「特定貨物に課する一般関税及び報復関税については、それぞれ別個の関税として関税法第二章の規定を適用する。」
- Structural literal: 第二章 → 2 is a CHAPTER CROSS-REFERENCE (関税法 chapter 2),
  NOT a substantive rate/threshold. spec_literals() = {2} by design;
  verified source_literals_verified({2}, scoped) = True (kanji 二 in 第二章);
  no 百分の rate, parse_statutory_rate(scoped) = None. No larger literal fabricated.
- 判定: BY-DESIGN/CONFIRMED — distinct EFFECT norm: 一般関税 and 報復関税 on the
  same 特定貨物 are EACH applied separately (それぞれ別個の関税として), never
  merged and never alternatives; each computed under the same chapter-2 rules.
  appliedSeparately = true; totalTariff g r = g + r (both summed). Chapter-2
  computation, goods classification and retaliation decision are NOT MODELLED
  (caller-established): 0/0=0, 1/2=3, 7/0=7, 100/50=150, 5/5=10.
- H/T/D/C/U: H（raw bytes SHA-256 and needle independently re-extracted）,
  T（Article Num 5, 第二章 = 2 as cross-reference, parallel application + sum,
  kernel-decided at 0/1/2/3/5/7/100/50）,
  D（specChapterRef/specSeparately/specTotal bodies contain no impl identifiers;
  independent_spec_ok = True）,
  C（agreeChapterRef / agreeSeparately / agreeTotal are unfold + rfl bridges only）,
  U（boundary categories from generate_verification_evidence with literals {2}:
  zero 0, small_input 1/2/3/5/7, saturation 0/0 and 7/0, threshold_below 1,
  threshold_at 2, threshold_above 3 — 6 >= 3）.
- 限定: 機械的独立クロスチェックであり人間の法律レビューではない
  (mechanical, not human, review). H/T/D/C/U is a machine-generated audit
  tuple, not a human sign-off; no lake/lean re-run here — only in-tree
  detector computations plus Python-simulated Nat arithmetic.
