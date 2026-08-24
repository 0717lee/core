// Copyright 2026 International Digital Economy Academy
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

///|
/// Deprecated: use `to_string(radix=16)` instead.
#deprecated("Use `to_string(radix=16)` instead")
#coverage.skip
#cfg(not(target="js"))
pub fn BigInt::to_hex(self : BigInt, uppercase? : Bool = true) -> String {
  let value = self.to_string(radix=16)
  if !uppercase {
    return value
  }
  let result = StringBuilder(size_hint=value.length())
  for char in value {
    result.write_char(
      if char >= 'a' && char <= 'f' {
        (char.to_int() + ('A' - 'a')).unsafe_to_char()
      } else {
        char
      },
    )
  }
  result.to_string()
}

///|
/// Deprecated: use `to_string(radix=16)` instead.
#deprecated("Use `to_string(radix=16)` instead")
#coverage.skip
#cfg(target="js")
pub extern "js" fn BigInt::to_hex(
  self : BigInt,
  uppercase? : Bool = true,
) -> String =
  #|(x, uppercase) => {
  #|  const r = x.toString(16);
  #|  return uppercase ? r.toUpperCase() : r;
  #|}

///|
/// Deprecated: use `from_string(radix=16)` instead.
#deprecated("Use `from_string(radix=16)` instead")
#coverage.skip
#cfg(not(target="js"))
pub fn BigInt::from_hex(input : String) -> BigInt {
  BigInt::from_string(input, radix=16)
}

///|
/// Deprecated: use `from_string(radix=16)` instead.
#deprecated("Use `from_string(radix=16)` instead")
#coverage.skip
#cfg(target="js")
pub extern "js" fn BigInt::from_hex(str : String) -> BigInt =
  #|(x) => x.startsWith('-') ? -BigInt(`0x${x.slice(1)}`) : BigInt(`0x${x}`)
