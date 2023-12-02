const keyframes = {
  fadeDown: {
    in: [
      { opacity: 0, transform: "translateY(-10px)" },
      { opacity: 100, transform: "translateY(0px)" },
    ],
    out: [{ opacity: 100 }, { opacity: 0 }],
  },
  flip: {
    in: [{ transform: "rotate(0deg)" }, { transform: "rotate(180deg)" }],
    out: [{ transform: "rotate(180deg)" }, { transform: "rotate(0deg)" }],
  },
};

const easings = {
  linear: "linear",
  easeIn: "cubic-bezier(0.4, 0, 1, 1)",
  easeOut: "cubic-bezier(0, 0, 0.2, 1)",
  easeInOut: "cubic-bezier(0.4, 0, 0.2, 1)",
};

const makeOptions = (keyframeEffectOptions) => {
  const defaults = { easing: easings.linear, duration: 500, iterations: 1 };
  return {
    ...defaults,
    ...keyframeEffectOptions,
  };
};

export const makeAnimation = (elem) => {
  const animationType = elem.dataset.compoundsAnimation;
  const easing = elem.dataset.compoundsAnimationEasing;

  if (!easings[easing]) {
    throw new Error(
      `data-compounds-animation-easing="${easing}" does not exist. Available options are: ${Object.keys(
        easings
      ).map((k) => "\n - " + k)}`
    );
  }

  if (!keyframes[animationType]) {
    throw new Error(
      `data-compounds-animation="${animationType}" does not exist. Available options animations are: ${Object.keys(
        keyframes
      ).map((k) => "\n - " + k)}`
    );
  }

  const options = makeOptions({
    easing: easings[easing] || "linear",
    duration: Number(elem.dataset.compoundsAnimationDuration) || 500,
    iterations: Number(elem.dataset.compoundsAnimationIterations) || 1,
  });

  return {
    in: new Animation(
      new KeyframeEffect(elem, keyframes[animationType].in, options),
      document.timeline
    ),
    out: new Animation(
      new KeyframeEffect(elem, keyframes[animationType].out, options),
      document.timeline
    ),
  };
};
