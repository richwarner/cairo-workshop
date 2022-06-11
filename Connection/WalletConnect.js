import { connect } from '@argent/get-starknet'
let starknet = null
const connectWallet = async () => {
  starknet = await connect()
  if (!starknet) {
    throw Error(
      'No connection found'
    )
  }
  await starknet.enable()
  // Check if connection was successful
  if (starknet.isConnected) {
    console.log('connected to wallet')
  } else {
    console.log('wallet not connected')
  }
}

////////



const CONTRACT_ADDRESS =
  '0x....'


// Reads from the chain using callContract
const readValue = async () => {
  try {
    const res = await starknet.provider.callContract({
      contractAddress: CONTRACT_ADDRESS,
      entrypoint: 'some_view_function',
    })
    myValue = Number(`${res.result[0]}`)
  } catch (error) {
    console.error(error)
  }
}
// Writes on-chain using execute
const saveValue = async () => {
  try {
    const trxDetails = await starknet.account.execute({
      contractAddress: CONTRACT_ADDRESS,
      entrypoint: 'save_value',
      calldata: [value],
    })
    console.log('trxDetails', trxDetails)
  } catch (error) {
    console.error(error)
  }
}



