export const idlFactory = ({ IDL }) => {
  return IDL.Service({
    'compoundInterest' : IDL.Func([], [], ['oneway']),
    'getBalance' : IDL.Func([], [IDL.Float64], ['query']),
    'topUp' : IDL.Func([IDL.Float64], [], ['oneway']),
    'withdraw' : IDL.Func([IDL.Float64], [], ['oneway']),
  });
};
export const init = ({ IDL }) => { return []; };
