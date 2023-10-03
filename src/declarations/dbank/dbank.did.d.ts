import type { Principal } from '@dfinity/principal';
export interface _SERVICE {
  'compoundInterest' : () => Promise<undefined>,
  'getBalance' : () => Promise<number>,
  'topUp' : (arg_0: number) => Promise<undefined>,
  'withdraw' : (arg_0: number) => Promise<undefined>,
}
