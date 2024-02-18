export function debounce(func: (...args: any[]) => any, timeout: number) {
	let timer = null;
	return (...args: any[]) => {
		clearTimeout(timer);
		timer = setTimeout(() => {
			func.apply(null, args);
		}, timeout);
	};
}

export function throttle(func: (...args: any[]) => any, timeout: number) {
	let waiting = false;
	return (...args: any[]) => {
		if (!waiting) {
			func.apply(null, args);
			setTimeout(() => (waiting = false), timeout);
			waiting = true;
		}
	};
}
