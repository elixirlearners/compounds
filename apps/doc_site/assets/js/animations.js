const easings = {
  linear: "linear",
  easeIn: "cubic-bezier(0.4, 0, 1, 1)",
  easeOut: "cubic-bezier(0, 0, 0.2, 1)",
  easeInOut: "cubic-bezier(0.4, 0, 0.2, 1)",
  bounce: "cubic-bezier(.67, 2.1, .33, .65)",
  bounce2: "cubic-bezier(.67, 1.7, .33, .65)",
  spring: "cubic-bezier(.67, 1.5, .4, .99)",
  stiffSpring: "cubic-bezier(0.5, 1.4, .15, 1)",
};

class CompoundAnimation {
  /**
   * Constructs a new instance of the class.
   *
   * @param {HTMLElement} element - The element to be used.
   * @param {Array} keyframes - Keyframes
   * @param {object} options - The options for the animation.
   * @param {number} options.duration - The duration of the animation in milliseconds. Default is 500.
   * @param {string} options.easing - The easing function to be used. Default is "linear".
   * @param {string} options.fill - The fill mode of the animation. Default is "none".
   * @return {void}
   */
  constructor(element, options = {}) {
    this.element = element;
    this.options = options;

    // Object to hold the CSS properties that the element will animate to
    this.keyframes = {};
    // Object to hold the initial CSS properties of the element
    this.initialProperties = {};
    // Helper object for the transforms property
    this.currentTransforms = {
      scale: 1,
      translateX: 0,
      translateY: 0,
      rotate: 0,
    };
  }

  /**
   * Apply transforms to the element.
   *
   * @param {object} transforms - The transforms to apply.
   * @param {number} transforms.translateX - The amount to translate the element on the X-axis.
   * @param {number} transforms.translateY - The amount to translate the element on the Y-axis.
   * @param {number} transforms.scale - The scale factor to apply to the element.
   * @param {number} transforms.rotate - The angle in degrees to rotate the element.
   * @return {string} The CSS transform string representing the applied transforms.
   */
  _applyTransforms(transforms) {
    this.currentTransforms = transforms;
    return `translateX(${transforms.translateX}) translateY(${transforms.translateY}) scale(${transforms.scale}) rotate(${transforms.rotate}) translateZ(0)`;
  }

  /**
   * Retrieves the current properties of the element.
   *
   * @return {Object} An object containing the current animatable properties of the element.
   */
  _getCurrentProperties() {
    return Object.keys(this.keyframes).reduce((acc, prop) => {
      return { ...acc, [prop]: getComputedStyle(this.element)[prop] };
    }, {});
  }

  /**
   * Adds a keyframe to the animation object.
   *
   * @param {string} property - The CSS property to animate.
   * @param {any} value - The value to animate the property to.
   */
  _addKeyframe(property, value) {
    // Reference the computed initial value so we can animate to the start position
    this.initialProperties[property] = getComputedStyle(this.element)[property];

    this.keyframes[property] = value;
  }

  /**
   * Moves the element along the X axis by a specified amount.
   *
   * @param {string} translateX - The amount to translate the element along the X axis.
   * @return {CompoundAnimation} - The modified CompoundAnimation.
   */
  moveX(translateX) {
    this._addKeyframe(
      "transform",
      this._applyTransforms({ ...this.currentTransforms, translateX })
    );
    return this;
  }

  /**
   * Move the element on the Y-axis by a given value.
   *
   * @param {string} translateY - The amount to translate the element on the Y-axis.
   * @return {CompoundAnimation} - The modified CompoundAnimation.
   */
  moveY(translateY) {
    this._addKeyframe(
      "transform",
      this._applyTransforms({ ...this.currentTransforms, translateY })
    );
    return this;
  }

  /**
   * Scales the element by a given factor.
   *
   * @param {number} scale - The factor by which to scale the element.
   * @return {CompoundAnimation} - The modified CompoundAnimation.
   */
  scale(scale) {
    this._addKeyframe(
      "transform",
      this._applyTransforms({ ...this.currentTransforms, scale })
    );
    return this;
  }

  /**
   * Rotates the element by a specified angle.
   *
   * @param {string} rotate - The angle of rotation in degrees.
   * @return {CompoundAnimation} - The modified CompoundAnimation.
   */
  rotate(rotate) {
    this._addKeyframe(
      "transform",
      this._applyTransforms({ ...this.currentTransforms, rotate })
    );
    return this;
  }

  /**
   * Sets the opacity of the element.
   *
   * @param {number} opacity - The desired opacity value, ranging from 0 to 1.
   * @return {CompoundAnimation} - The modified CompoundAnimation.
   */
  opacity(opacity) {
    this._addKeyframe("opacity", opacity);
    return this;
  }

  /**
   * Sets the color of the element.
   *
   * @param {string} color - The color to be set.
   * @return {CompoundAnimation} - The modified CompoundAnimation.
   */
  color(color) {
    this._addKeyframe("color", color);
    return this;
  }

  /**
   * Sets the background color of the element.
   *
   * @param {string} color - The color value for the background.
   * @return {CompoundAnimation} - The modified CompoundAnimation.
   */
  bgColor(color) {
    this._addKeyframe("backgroundColor", color);
    return this;
  }

  /**
   * Sets the width of the element.
   *
   * @param {string} width - The width of the element.
   * @return {CompoundAnimation} - The modified CompoundAnimation.
   */
  width(width) {
    this._addKeyframe("width", width);
    return this;
  }

  /**
   * Sets the height of the element.
   *
   * @param {string} height - The height value to be set.
   * @return {CompoundAnimation} - The modified CompoundAnimation.
   */
  height(height) {
    this._addKeyframe("height", height);
    return this;
  }

  /**
   * Add a keyframe for the maximum height of an element.
   *
   * @param {string} height - The maximum height of the element.
   * @return {CompoundAnimation} - The modified CompoundAnimation.
   */
  maxHeight(height) {
    this._addKeyframe("maxHeight", height);
    return this;
  }

  /**
   * Sets the border radius of the element.
   *
   * @param {string} radius - The border radius to be set.
   * @return {CompoundAnimation} - The modified CompoundAnimation.
   */
  borderRadius(radius) {
    this._addKeyframe("borderRadius", radius);
    return this;
  }

  /**
   * Runs an animation from the current properties to the specified properties.
   *
   * @param {Object} to - The target properties to animate to.
   * @return {Animation} The animation object representing the running animation.
   */
  _runAnimation(to) {
    const from = this._getCurrentProperties();

    let runningAnimations = this.element.getAnimations();
    let duration = this.options.duration;

    if (runningAnimations.length) {
      runningAnimations.forEach((anim) => {
        anim.pause();
        const timing = anim.effect.getComputedTiming();
        const activeDuration = timing.activeDuration;
        const activeProgress = timing.progress;
        duration =
          duration - (activeDuration - activeProgress * activeDuration);
        anim.cancel();
      });
    }

    return this.element.animate([from, to], {
      duration,
      iterations: this.options.iterations,
      easing: this.options.easing,
      fill: this.options.fill,
    });
  }

  /**
   * Executes the animation and returns the Web Animation object.
   *
   * @param {Object} callbacks - Optional callbacks for various animation events.
   * @param {Function} callbacks.onBegin - Callback function to be called when the animation begins.
   * @param {Function} callbacks.onFinish - Callback function to be called when the animation finishes.
   * @param {Function} callbacks.onCancel - Callback function to be called when the animation is canceled.
   * @return {Animation} The animation object.
   */
  play(callbacks = {}) {
    if (callbacks.onBegin) callbacks.onBegin();
    const animation = this._runAnimation(this.keyframes);
    if (callbacks.onFinish) animation.onfinish = callbacks.onFinish;
    if (callbacks.onCancel) animation.oncancel = callbacks.onCancel;
    return animation;
  }

  /**
   * Executes the animation to its initial values and returns the Web Animation object.
   *
   * @param {Object} callbacks - Optional callbacks for various animation events.
   * @param {Function} callbacks.onBegin - Callback function to be called when the animation begins.
   * @param {Function} callbacks.onFinish - Callback function to be called when the animation finishes.
   * @param {Function} callbacks.onCancel - Callback function to be called when the animation is canceled.
   * @return {CompoundAnimation} The animation object.
   */
  reverse(callbacks = {}) {
    if (callbacks.onBegin) callbacks.onBegin();
    const animation = this._runAnimation(this.initialProperties);
    if (callbacks.onFinish) animation.onfinish = callbacks.onFinish;
    if (callbacks.onCancel) animation.oncancel = callbacks.onCancel;
    return animation;
  }
}

/**
 * Creates an animation for the specific element
 *
 * @param {HTMLElement} element - The element to be animated.
 * @return {CompoundAnimation} The created animation object.
 */
const animate = (element) => {
  const easing = element.dataset.compoundsAnimationEasing;

  if (!easings[easing]) {
    throw new Error(
      `data-compounds-animation-easing="${easing}" does not exist. Available options animations are: ${Object.keys(
        easings
      ).map((k) => "\n - " + k)}`
    );
  }
  console.log(easings[easing]);
  const options = {
    easing: easings[easing],
    duration: Number(element.dataset.compoundsAnimationDuration) || 500,
    iterations: Number(element.dataset.compoundsAnimationIterations) || 1,
    fill: element.dataset.compoundsAnimationFill || "forwards",
  };

  return new CompoundAnimation(element, options);
};

export default animate;
