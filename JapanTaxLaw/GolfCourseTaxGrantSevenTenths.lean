/-!
# GolfCourseTaxGrantSevenTenths — 地方税法施行規則 第八条の十三（CONDITION）

Sources (pinned): law `329M50000002023` / rev `329M50000002023_20261101_508M60000008045`.
Raw snapshot: `data/raw/329M50000002023_20261101_508M60000008045.law.json`.

原文:
「前年度三月から七月までの間に収入した当該市町村に所在するゴルフ場に係るゴルフ場利用税の額（二以上の市町村にまたがつて所在するゴルフ場に係るゴルフ場利用税については当該ゴルフ場利用税の額を当該ゴルフ場の総面積に対する当該市町村に係る当該ゴルフ場の面積の割合によつてあん分した額とし、当該期間内に当該市町村に所在するゴルフ場に係るゴルフ場利用税についての過誤納に係る還付金を歳出予算から支出した場合においては、当該支出した額を控除した額とする。以下本表において「ゴルフ場のゴルフ場利用税の額」という。）の十分の七に相当する額」

Computation: 二以上の市町村にまたがる場合は面積割合であん分し、過誤納還付を控除した额の
十分の七を交付額とする。
Scope: 収入期間の具体的な日付判定・「総面積」の測量は NOT MODELLED（入力として受け取る）。
法的レビューを提供しない。
-/

namespace JapanTaxLaw.GolfCourseTaxGrantSevenTenths

/-- 面積割合によるあん分（総面積が 0 のときは 0、自然数除算は切捨て）。 -/
def prorated (tax : Nat) (area : Nat) (total : Nat) : Nat :=
  if total = 0 then 0 else tax * area / total

/-- 過誤納還付の控除（Nat の saturation 減算）。 -/
def netAmount (tax : Nat) (area : Nat) (total : Nat) (refund : Nat) : Nat :=
  prorated tax area total - refund

/-- 十分の七に相当する額。 -/
def grantAmount (tax : Nat) (area : Nat) (total : Nat) (refund : Nat) : Nat :=
  netAmount tax area total refund * 7 / 10

example : grantAmount 100 3 4 0 = 52 := by decide
example : grantAmount 100 4 4 0 = 70 := by decide
example : grantAmount 100 0 4 0 = 0 := by decide
example : grantAmount 100 3 4 100 = 0 := by decide
example : grantAmount 100 3 0 0 = 0 := by decide

end JapanTaxLaw.GolfCourseTaxGrantSevenTenths
