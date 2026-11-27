### FilingDateException.lean — 通算法人 第六条（指定期日が提出期限前の日の例外）

- 独立再抽出（一次資料）: law id 426CO0000000139; revision
  426CO0000000139_20260401_508CO0000000095; source
  data/raw/426CO0000000139_20260401_508CO0000000095.law.json;
  blob 91,424 bytes, SHA-256 independently recomputed
  `2239be3cdc09998cc3a9c75a05d8b8c6b47df4135ec708cdcb6aa31f40d76dcf`
  — matches the impl pin.
- 照合（Article Num 6, scoped 原文）: needle found verbatim, 一字一句改変なし:
  「ただし、当該指定された期日が当該他の通算法人の同条第一項の規定による申告書の提出期限前の日である場合は、この限りでない。」
- Structural literal: 第一項 → 1 is a CROSS-REFERENCE IDENTIFIER to paragraph 1
  of the same article, NOT a substantive threshold. Therefore
  spec_literals() = [] by design (it filters v > 1); no larger literal is
  fabricated. Verified directly: source_literals_verified({1}, scoped) = True
  (kanji 一 occurs in scoped Article 6). No 百分の rate; parse_statutory_rate = None.
- 判定: BY-DESIGN/CONFIRMED — EXCEPTION with strict temporal-ordering trigger.
  `isBeforeDeadline d f = decide (d < f)` fires only for d < f; equality does not
  fire. `baseRuleApplies d f = decide (f <= d)` is the exact complement:
  9/10 false, 10/10 true, 11/10 true. No off-by-one; calendar arithmetic and the
  legal effect of この限りでない are NOT MODELLED (caller-established day indices).
- H/T/D/C/U: H（raw bytes SHA-256 and needle independently re-extracted）,
  T（Article Num 6, 第一項 = 1 as cross-reference, strict < vs <=, kernel-decided
  at 9/10/10/10/11/10 and 0/1 boundaries）,
  D（specItemRef/specBefore/specBaseApplies bodies contain no impl identifiers;
  independent_spec_ok = True）,
  C（agreeItemRef / agreeBefore / agreeBase are unfold + rfl bridges only）,
  U（boundary categories: zero 0, small_input 1/9/10/11, saturation at the
  equality boundary 0/0 and 10/10 — 3 >= 3）.
- 限定: 機械的独立クロスチェックであり人間の法律レビューではない
  (mechanical, not human, review). H/T/D/C/U is a machine-generated audit tuple,
  not a human sign-off; no lake/lean re-run here — only in-tree detector
  computations plus Python-simulated Nat/Bool expectations.
