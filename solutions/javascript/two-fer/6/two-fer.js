// export const twoFer = name => name ? "One for " + name + ", one for me." : "One for you, one for me."


export const twoFer = (name = 'you') => name ? `One for ${name}, one for me.` : `One for you, one for me.`
